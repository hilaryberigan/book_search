## response object to pull in data from google books api as a whole, map items array to volume objects array to better display in view

require 'volume'

module Books

  class Response
    attr_reader :volumes, :total_items, :end_page, :total_pages, :start_page

    def initialize(input, max_results, start_page)
      @volumes = []
      @total_items = input["totalItems"]
      @start_page = start_page
      items = input.parsed_response["items"] || []
      @total_pages = @total_items.to_i / (max_results || 10).to_i
      end_page = start_page.to_i + 5 
      @end_page = [@total_pages, end_page].min
  	  map_to_volumes(items) if @total_items && @total_items > 0 
    end

    def map_to_volumes(response_items)
      response_items.each do |item|
        @volumes.push(Volume.new(item))
      end
    end
  end
end