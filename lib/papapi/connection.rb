module Papapi
  class Connection    

    attr_reader :session, :uri

    def initialize (uri, user, pass)
      @uri = URI.parse(uri)
      start_session(user, pass)
      
      yield self if block_given?
    end

    def post (clazz, method, attributes = {})
      Request.post(self, clazz, method, attributes)
    end

    def create_affiliate (data)
      post(
        'Pap_Signup_AffiliateForm',
        'add',
        'username'       => data[:username],
        'rpassword'      => data[:password],
        'firstname'      => data[:firstname],
        'lastname'       => data[:lastname],
        'parentuserid'   => data[:parentuserid],
        'data1'          => data[:url],
        'data2'          => data[:company],
        'data3'          => data[:street],
        'data4'          => data[:city],
        'data5'          => data[:state],
        'data6'          => data[:country],
        'data7'          => data[:zip],
        'data8'          => data[:phone],
        'refid'          => data[:refid],
        'agreeWithTerms' => 'Y'
      )
    end

  private
  
    def start_session(user, pass)
      @session = Session.new(self, user, pass)
    end

  end
end