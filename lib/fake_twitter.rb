class FakeTwitter
  def self.[]=(term, results)
    @results ||= {}
    @results[term] = results
  end

  def self.search(term)
    results = @results.fetch(term) { [] }.map do |r|
      Twitter::Status.new(r.merge(id: 1))
    end
    OpenStruct.new(results: results)
  end
end
