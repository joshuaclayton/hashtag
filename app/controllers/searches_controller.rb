class SearchesController < ApplicationController
  def new

  end

  def create
    search_term = params[:search][:search]
    redirect_to search_path(search_term.gsub(/#/, ''))
  end

  def show
    @tweets = Searcher.new("##{params[:id]}").results
  end
end
