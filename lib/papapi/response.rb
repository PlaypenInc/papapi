module Papapi
  class Response

    REMOVE_VARS = ['name', 'correspondsApi', 'language']

    def initialize (http_response)
      @http_response = http_response
      check_for_errors
    end

    def to_json
      @json ||= JSON.parse(@http_response.body).first
    end

    def fields
      unless @fields
        @fields = {}

        self.to_json['fields'].each do |field|
          next if REMOVE_VARS.include? field[0]
          @fields[field[0].to_sym] = field[1]
        end
      end
      @fields
    end

    def [] (key)
      fields[key]
    end

  private

    def check_for_errors
      if to_json['success'] != 'Y' && to_json['message']
        raise to_json['message']
      end
    end

  end
end