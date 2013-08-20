class Searcher
  def initialize(term)
    @term = term
  end

  def each(&block)
    Twitter.search(@term).results.each &block
  end
end
