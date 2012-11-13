class FakeTwitter
  def self.[]=(term, results)
    @results ||= {}
    @results[term] = results.map {|hash| Twitter::Status.new(hash.merge(id: 1234)) }
  end

  def self.[](term)
    @results[term]
  end

  def self.search(term)
    OpenStruct.new(results: @results.fetch(term, []))
  end

  def self.clear
    @results = {}
  end
end
