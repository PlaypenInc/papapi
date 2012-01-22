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

  end
end