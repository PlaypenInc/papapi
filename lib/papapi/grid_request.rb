module Papapi
  class GridRequest < Request
    def response
      @response ||= GridResponse.new(connection.post(post_vars))
    end
  end
end