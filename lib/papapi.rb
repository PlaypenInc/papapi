require 'net/http'
require 'uri'
require 'json'
require 'hashie'
require 'papapi/version'
require 'papapi/connection'
require 'papapi/session'
require 'papapi/request'
require 'papapi/post_request'
require 'papapi/response'
require 'papapi/affiliate'

module Papapi

  class << self
    def config
      yield self
    end
    
    def uri= (uri)
      @uri = uri
    end
    
    def uri
      @uri
    end

    def user= (user)
      @user = user
    end
    
    def user
      @user
    end

    def pass= (pass)
      @pass = pass
    end
    
    def pass
      @pass
    end

    def connection
      @connection ||= Connection.new(uri, user, pass)
    end
  end

end