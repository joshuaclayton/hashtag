class SearchesController < ApplicationController
  def new
  end

  def create
    redirect_to search_path(search_term_without_hash)
  end

  def show
    search_term = "##{params[:id]}"
    @statuses = Twitter.search(search_term).results
  end

  private

  def search_term_without_hash
    params[:search][:search_term].gsub(/#/, '')
  end
end
