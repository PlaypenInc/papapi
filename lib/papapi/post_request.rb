module Papapi
  class PostRequest < Request

    # Different kind of request requires arguments to
    # be passed differently.
    def arguments
      fields = [
        ["name", "value", "values", "error"],
      ]
    
      super.each do |key, value|
        fields << [key, value, nil, ""]
      end
  
      fields
    end
  
  end
end