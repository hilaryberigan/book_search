class VolumesController < ApplicationController
  def index
    books_api = BooksApi.new(search_filters)
    @response = books_api.list(search_input)
  end

  def show
    books_api = BooksApi.new(search_filters)
    @response = books_api.search(search_input)
  end


private 
  def search_filters
    params.require(:search).permit([ :filter, :lang_restrict, :max_results , :order_by, :projection, :start_index, :volume_id, :fields])
  end

  def search_input
  	params.require(:search).permit([:input])
  end

  def 

end