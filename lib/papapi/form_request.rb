module Papapi
  class FormRequest < Request

    # Different kind of request requires arguments to
    # be passed differently.
    def arguments
      fields = [
        ["name", "value", "values", "error"],
      ]
    
      super.each do |key, value|
        fields << [key, value, nil, ""]
      end
  
      {:fields => fields}
    end

    def response
      @response ||= FormResponse.new connection.post(post_vars)
    end
  
  end
end