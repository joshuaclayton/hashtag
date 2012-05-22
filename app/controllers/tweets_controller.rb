class TweetsController < ApplicationController
  def index
  end

  def show
    search_term = "##{params[:id]}"
    @tweets = Searcher.new(search_term).search
  end
end
