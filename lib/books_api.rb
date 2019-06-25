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
  	max = @options[:max_results] || 10
  	@parameters ||=
    { 
      filter: @options[:filter],
      langRestrict: @options[:lang_restrict],
      maxResults: max,
      orderBy: @options[:order_by],
      projection: @options[:projection],     
      startIndex: (max.to_i * (@options[:start_page].to_i - 1)) + 1,
      volumeId: @options[:volume_id],
      key: @options[:key],
      fields: @options[:fields],
      key: 'AIzaSyDtnatF4lxEI-Nx8mh-i6da480-gmGiM5Y' #move this to secrets
    }.delete_if{|key, value| value.blank?}
  end

  def send_api_request(url)
  	response = HTTParty.get(url)
  	Books::Response.new(response)
  end

  def root_url
    "https://www.googleapis.com/books/v1/volumes"
  end

end