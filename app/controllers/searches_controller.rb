class SearchesController < ApplicationController
  def new
  end

  def create
    search_term = params[:search][:search].gsub(/#/, '')
    redirect_to search_path(search_term)
  end

  def show
    @tweets = Twitter.search("##{params[:id]}").results
  end
end
