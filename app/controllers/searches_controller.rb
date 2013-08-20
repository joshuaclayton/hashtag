class SearchesController < ApplicationController
  def new

  end

  def create
    term = params[:search][:search_term].gsub(/^#(.*)/, '\1')
    redirect_to search_path(term)
  end

  def show
    term = "##{params[:id]}"
    @search_term = term
    @results = Twitter.search(term).results
  end
end
