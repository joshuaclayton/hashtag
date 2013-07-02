class Searcher
  class_attribute :backend
  self.backend = Twitter

  def initialize(term)
    @term = term
  end

  def statuses
    backend.search(@term).results
  end
end
