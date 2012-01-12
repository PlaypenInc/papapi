module Papapi
  class Session

    attr_reader :response

    def initialize (connection, user, pass)
      @response = connection.post(
        'Gpf_Api_AuthService',
        'authenticate',
        :username   => user,
        :password   => pass,
        :roleType   => "M",
        :apiVersion => "70544a5f74e11e13b7b61c4d98ae77e"
      )
    end

    def id
      @response[:S]
    end

  end
end