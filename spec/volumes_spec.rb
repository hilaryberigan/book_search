require 'rails_helper'
require_relative '../lib/books_api'
require_relative '../lib/volume'

describe "Books API List Request" do
  it "returns a Response Object that contains a list of Volumes" do 
  	options = { max_results: 10,
  		        start_page: 1 }
    
  	books_api = BooksApi.new(options)
  	response = books_api.list('hilary')
    expect(response).to be_an_instance_of(Books::Response)
    expect(response.volumes).to be_an_instance_of(Array)
    expect(response.volumes.first).to be_an_instance_of(Books::Volume)
  end
end


