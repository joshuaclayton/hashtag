class SearchesController < ApplicationController
  def show
    @search_term = "##{params[:id]}"
    @tweets = Searcher.new(@search_term)
  end

  def create
    redirect_to search_path(params[:searches][:search_term])
  end
end
