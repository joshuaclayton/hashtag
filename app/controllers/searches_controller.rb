class SearchesController < ApplicationController
  def show
    @search_term = "##{params[:id]}"
    @tweets = Twitter.search(@search_term).results
  end

  def create
    redirect_to search_path(params[:searches][:search_term])
  end
end
