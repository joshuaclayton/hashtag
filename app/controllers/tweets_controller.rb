class TweetsController < ApplicationController
  def index
  end

  def show
    search_term = "##{params[:id]}"
    @tweets = Twitter.search(search_term)
  end
end
