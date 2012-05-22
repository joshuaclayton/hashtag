class FakeTwitter
  def self.results
    @@results
  end

  def self.register_results(term, tweets)
    @@results ||= {}
    @@results[term] = tweets.map {|tweet| Twitter::Status.new(tweet) }
  end

  def self.search(term)
    @@results.fetch(term) { [] }
  end

  def self.clear_results
    @@results = nil
  end
end
