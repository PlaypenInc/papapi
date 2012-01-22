module Papapi
  class GridResponse < Response
    include Enumerable

    def attributes
      parsed['rows'].first
    end

    def rows
      parsed['rows'].slice(1, parsed['rows'].count-1)
    end

    def each
      rows.each do |row|
        yield Hash[*attributes.zip(row).flatten]
      end
    end
  end
end