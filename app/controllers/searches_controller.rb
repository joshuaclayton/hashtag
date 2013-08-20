class SearchesController < ApplicationController
  def new

  end

  def create
    term = params[:search][:search_term].gsub(/^#(.*)/, '\1')
    redirect_to search_path(term)
  end

  def show
    @search_term = "##{params[:id]}"
    @results = Searcher.new(@search_term)
  end
end
