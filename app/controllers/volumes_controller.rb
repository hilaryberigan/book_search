class VolumesController < ApplicationController
  require 'books_api'

  def index
    @search = {page: 1}
  end

  def search
  	@volumes = []
    @search = search_filters || {}
    @search[:start_page] = params[:page] || 1
    books_api = BooksApi.new(@search)
    @response = books_api.list(search_input)
  end

  def show
    books_api = BooksApi.new(search_filters)
    @response = books_api.search(search_input)
    @volume = response.volume
  end


private 
  def search_filters
    params.require(:search).permit([:input, :filter, :lang_restrict, :max_results , :order_by, :projection, :volume_id, :fields])
  end

  def search_input
  	params.require(:search).require(:input)
  rescue 
  	nil
  end

  def page
    @page ||= params[:page]
  end


end