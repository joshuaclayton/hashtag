class SearchesController < ApplicationController
  def new
  end

  def create
    redirect_to search_path(params[:search][:search])
  end

  def show
    @tweets = Search.new("##{params[:id]})")
  end
end
