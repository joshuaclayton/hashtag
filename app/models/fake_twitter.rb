require 'ostruct'

class FakeTwitter
  def self.clear
    @tweets = Hash.new([])
  end

  def self.[]=(term, tweet_data)
    @tweets ||= {}
    @tweets[term] = tweet_data
  end

  def self.search(term)
    @tweets ||= {}
    tweets = @tweets[term].map do |tweet_datum|
      Twitter::Status.new(tweet_datum.merge(id: 1234))
    end

    OpenStruct.new(results: tweets)
  end
end
