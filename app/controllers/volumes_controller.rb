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
    response = books_api.list(search_input)
    @search[:total_pages] = response.total_items.to_i / (@search[:max_results] || 10).to_i
    end_page = @search[:start_page].to_i + 5 
    @search[:end_page] = [@search[:total_pages].to_i, end_page.to_i].min
    @volumes = response.volumes
  end

  def show
    books_api = BooksApi.new(search_filters)
    @response = books_api.search(search_input)
    @volume = response.volume
  end

  def next_page
    @page + 1
  end

  def previous_page
    [(@page - 1), 1].max 
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