module Papapi
  class Model < Hashie::Trash
    def save!
      update_properties(save_response(:add).fields)
    end

    def update!
      update_properties(save_response(:save).fields)
    end

    def save_request(method)
      FormRequest.new(
        :class_name  => "#{self.class.pap_class}Form",
        :method_name => method,
        :arguments   => to_hash
      )
    end

    def save_response(method)
      save_request(method).response
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

      def update! (params)
        m = new params
        m.update!
        return m
      end
    end
  end
end
