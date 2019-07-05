# Representation of Google Books API

require 'response'
class BooksApi
  include HTTParty

  def initialize(options)
    @options = options
  end

  def list(query)
    parameters[:q] = query if query.present?
    formatted_query = parameters.map{|key, value| "#{key}=#{value}"}.join('&')
    send_api_request("#{root_url}?#{formatted_query}")
  end

  def search(query)
    send_api_request("#{root_url}/#{query}")
  end


private 
  def parameters
  	@parameters ||= parameter_hash.delete_if{|key, value| value.blank?}
  end

  def parameter_hash
    { 
      filter: @options[:filter],
      langRestrict: @options[:lang_restrict],
      maxResults: max_results,
      orderBy: @options[:order_by],
      projection: @options[:projection],     
      startIndex: find_start_index,
      volumeId: @options[:volume_id],
      key: @options[:key],
      fields: @options[:fields],
      key: 'AIzaSyDtnatF4lxEI-Nx8mh-i6da480-gmGiM5Y' #move this to secrets
    }
  end

  def find_start_index
    (max_results.to_i * (@options[:start_page].to_i - 1)) + 1
  end

  def max_results
    @options[:max_results] || 10
  end

  def send_api_request(url)
  	response = HTTParty.get(url)
  	Books::Response.new(response, @options[:max_results], @options[:start_page])
  end

  def root_url
    "https://www.googleapis.com/books/v1/volumes"
  end

end