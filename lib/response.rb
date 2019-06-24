require 'volume'

module Books

  class Response
    attr_reader :volumes, :total_items 

    def initialize(input)
      @volumes = []
      @total_items = input["totalItems"]
      items = input.parsed_response["items"] || []
  	  map_to_volumes(items) if @total_items > 0 
    end

    def map_to_volumes(response_items)
      response_items.each do |item|
        @volumes.push(Volume.new(item))
      end
    end
  end
end