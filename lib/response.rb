## response object to pull in data from google books api as a whole, map items array to volume objects array to better display in view

require 'volume'

module Books

  class Response
    attr_reader :volumes, :total_items, :start_page

    def initialize(input, max_results, start_page)
      @max_results = max_results
      @start_page = start_page
      @input = input
      @total_items = @input["totalItems"]
    end

    def total_pages
      @total_items.to_i / (@max_results || 10).to_i
    end

    def end_page
      temp_end = @start_page.to_i + 5 
      [total_pages, temp_end].min
    end

    def volumes
      @volumes ||= map_to_volumes 
    end

    private

    def map_to_volumes
      response_items = @input.parsed_response["items"] || []
      response_volumes = []
      response_items.each do |item|
        response_volumes.push(Volume.new(item))
      end
      response_volumes
    end
  end
end