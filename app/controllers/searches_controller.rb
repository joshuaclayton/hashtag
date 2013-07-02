class SearchesController < ApplicationController
  def new
  end

  def create
    redirect_to search_path(params[:search][:search_term].gsub(/#/, ''))
  end

  def show
    @statuses = Twitter.search("##{params[:id]}").results
  end
end
