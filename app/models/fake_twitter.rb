require 'ostruct'

class FakeTwitter
  def self.clear
    @tweets = Hash.new([])
  end

  def self.[]=(term, tweet_texts)
    @tweets ||= {}
    @tweets[term] = tweet_texts
  end

  def self.search(term)
    @tweets ||= {}
    tweets = @tweets[term].map do |tweet_text|
      Twitter::Status.new(text: tweet_text, id: 1234)
    end

    OpenStruct.new(results: tweets)
  end
end
