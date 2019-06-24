require 'volume'

module Books

  class Response
    attr_reader :volumes 

    def initialize(input)
      @volumes = []
  	  map_to_volumes(input)
    end

    def map_to_volumes(response_items)
      response_items.each do |item|
        @volumes.push(Volume.new(item))
      end
    end
  end
end