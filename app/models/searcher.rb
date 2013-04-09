class Searcher
  def initialize(term)
    @term = term
  end

  def results
    Twitter.search(@term).results
  end
end
