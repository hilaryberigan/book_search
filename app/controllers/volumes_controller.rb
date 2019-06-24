class VolumesController < ApplicationController
  require 'books_api'
  def index
  	@volumes = []
  	return if search_input.blank?
    books_api = BooksApi.new(search_filters)
    response = books_api.list(search_input)
    @volumes = response.volumes
  end

  def show
    books_api = BooksApi.new(search_filters)
    @response = books_api.search(search_input)
    @volume = response.volume
  end


private 
  def search_filters
    params.require(:search).permit([ :filter, :lang_restrict, :max_results , :order_by, :projection, :start_index, :volume_id, :fields])
  end

  def search_input
  	params.require(:search).require(:input)
  rescue 
  	nil
  end


end