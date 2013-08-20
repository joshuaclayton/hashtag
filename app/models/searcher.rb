class Searcher
  class_attribute :backend
  self.backend = Twitter

  def initialize(term)
    @term = term
  end

  def each(&block)
    backend.search(@term).results.each &block
  end
end
