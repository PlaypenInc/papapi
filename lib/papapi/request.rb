module Papapi
  class Request

    class << self

      # Post a new request to the PAP Api.
      def post (connection, class_name, method_name, attributes = {})
        # pp JSON.parse(post_vars(connection, class_name, method_name, attributes)[:D])
        
        Response.new Net::HTTP.post_form(
          connection.uri,
          post_vars(connection, class_name, method_name, attributes)
        )
      end

      # Return post vars for request. Sets D as a json encoded
      # string of all our attributes.
      def post_vars (connection, class_name, method_name, attributes)
        vars = {
          "C" => "Gpf_Rpc_Server",
          "M" => "run",
          "requests" => [{
            "C"         => class_name,
            "M"         => method_name,
            "isFromApi" => "Y",
            "fields"    => post_fields(connection, attributes)
          }]
        }

        vars['S'] = connection.session.id if connection.session
        
        {:D => vars.to_json}
      end

      # Take all of our attributes and make an array out of them
      # plus add fields required by PAP Api.  Also add the session
      # id if a session exists.
      def post_fields (connection, attributes)
        fields = [
          ["name", "value", "values", "error"],
        ]
      
        attributes.each do |key, value|
          fields << [key, value, nil, ""]
        end

        fields
      end

    end 

  end
end