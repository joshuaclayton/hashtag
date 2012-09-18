class FakeTwitter
  def initialize(tweets)
    @tweets = tweets.map {|tweet| Twitter::Status.new(tweet.merge(id: 123)) }
  end

  def search(term)
    OpenStruct.new(results: @tweets)
  end
end
