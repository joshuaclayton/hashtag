class FakeTwitter
  def self.register_results(term, tweets)
    @@results ||= {}
    @@results[term] = tweets.map {|tweet| Twitter::Status.new(tweet) }
  end

  def self.search(term)
    @@results[term]
  end
end
