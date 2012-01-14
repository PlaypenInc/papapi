module Papapi
  class Connection    

    attr_reader :user,
                :pass

    def initialize (uri, user, pass)
      @uri  = URI.parse(uri)
      @user = user
      @pass = pass
    end

    def post (vars)
      Net::HTTP.post_form(@uri, vars)
    end

    def session
      @session ||= Session.new(self)
    end

    def session_id
      session.id
    end

    def request (opt)
      Request.new opt.merge({:connection => self})
    end

    def post_request (opt)
      PostRequest.new opt.merge({:connection => self})
    end

  end
end