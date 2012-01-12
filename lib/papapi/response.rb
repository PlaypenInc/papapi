module Papapi
  class Response

    REMOVE_VARS = ['name', 'correspondsApi', 'language']

    attr_reader :http_response, :fields, :error

    def initialize (http_response)
      @http_response = http_response
      parse_response
      parse_fields
    end

    def to_json
      @json ||= JSON.parse(@http_response.body).first
    end

    def [] (key)
      fields[key]
    end

  private

    def parse_response
      if to_json['success'] != 'Y' && to_json['message']
        raise to_json['message']
      end
    end

    def parse_fields
      @fields = {}

      self.to_json['fields'].each do |field|
        next if REMOVE_VARS.include? field[0]
        @fields[field[0].to_sym] = field[1]
      end
      
      @fields
    end

  end
end