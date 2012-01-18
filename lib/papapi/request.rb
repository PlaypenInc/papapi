module Papapi
  class Request

    attr_accessor :connection,
                  :class_name,
                  :method_name,
                  :arguments,
                  :skip_session

    def initialize (opt = {})
      opt.each do |attr, value|
        send "#{attr}=", value
      end
    end

    def response
      @response ||= Response.new connection.post(post_vars)
    end

    # Return post vars for request. Sets D as a json encoded
    # string of all our attributes.
    def post_vars
      vars = {
        "C" => "Gpf_Rpc_Server",
        "M" => "run",
        "requests" => [{
          "C"         => class_name,
          "M"         => method_name,
          "isFromApi" => "Y",
          "fields"    => arguments
        }]
      }

      vars['S'] = connection.session_id unless skip_session?
      
      {:D => vars.to_json}
    end

    def skip_session?
      !!skip_session
    end

  end
end