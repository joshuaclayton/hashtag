require 'ostruct'

class FakeTwitter
  def self.reset
    @tweet_dictionary = Hash.new([])
  end

  def self.searching_for(term)
    Searcher.backend = FakeTwitter
    SearchResults.new(term, @tweet_dictionary)
  end

  def self.search(term)
    statuses = @tweet_dictionary[term].map do |tweet|
      Twitter::Status.new(tweet.merge(id: 1234))
    end
    OpenStruct.new(results: statuses)
  end

  class SearchResults
    def initialize(term, tweet_dictionary)
      @term = term
      @tweet_dictionary = tweet_dictionary
    end

    def returns(value)
      @tweet_dictionary[@term] = value
    end
  end
end
