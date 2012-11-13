class SearchesController < ApplicationController
  def new

  end

  def create
    redirect_to search_path(params[:search][:term])
  end

  def show
    @tweets = Searcher.new(search_term)
  end

  private

  def search_term
    "##{params[:id]}"
  end
end
