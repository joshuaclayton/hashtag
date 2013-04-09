require 'ostruct'

class FakeTwitter
  def self.[]=(key, value)
    @data ||= {}
    @data[key] = value
  end

  def self.search(term)
    results = @data.fetch(term, []).map {|hash| Twitter::Tweet.new(hash.merge(id: 1234)) }
    OpenStruct.new(results: results)
  end

  def self.clear
    @data = {}
  end
end
