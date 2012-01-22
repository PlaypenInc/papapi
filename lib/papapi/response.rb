module Papapi
  class Response

    REMOVE_VARS = ['name', 'correspondsApi', 'language']

    def initialize (http_response)
      @http_response = http_response
      check_for_errors
    end

    def parsed
      @parsed ||= JSON.parse(@http_response.body).first
    end

  private

    def check_for_errors
      raise parsed['message'] if parsed['success'] != 'Y' && parsed['message']
      raise parsed['e']       if parsed['e']
    end

  end
end