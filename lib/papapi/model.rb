module Papapi
  class Model < Hashie::Trash
    def save!
      update_properties(save_response.fields)
    end
    
    def save_request
      FormRequest.new(
        :class_name  => "#{self.class.pap_class}Form",
        :method_name => 'add',
        :arguments   => to_hash
      )
    end
    
    def save_response
      save_request.response
    end

    def update_properties (new_props)
      new_props.each do |key,value|
        send("#{key}=", value) if respond_to?("#{key}=")
      end
      true
    end
    
    class << self
      def set_pap_class (class_name)
        @pap_class = class_name
      end

      def pap_class
        @pap_class
      end
      
      def create! (params)
        m = new params
        m.save!
        return m
      end      
    end
  end
end