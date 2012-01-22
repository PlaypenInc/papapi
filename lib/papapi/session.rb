module Papapi
  class Session

    def initialize (connection)
      @connection = connection
    end

    def request
      @request ||= FormRequest.new(
        :skip_session => true,
        :connection   => @connection,
        :class_name   => 'Gpf_Api_AuthService',
        :method_name  => 'authenticate',
        :arguments    => {
          :username   => @connection.user,
          :password   => @connection.pass,
          :roleType   => 'M',
          :apiVersion => '70544a5f74e11e13b7b61c4d98ae77e'
        })
    end

    def response
      request.response
    end

    def id
      response[:S]
    end
  end
end