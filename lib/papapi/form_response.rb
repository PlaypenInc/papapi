module Papapi
  class FormResponse < Response

    def fields
      unless @fields
        @fields = {}

        self.parsed['fields'].each do |field|
          next if REMOVE_VARS.include? field[0]
          @fields[field[0].to_sym] = field[1]
        end
      end
      @fields
    end

    def [] (key)
      fields[key]
    end

  end
end