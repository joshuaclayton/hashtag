class Searcher
  class_attribute :backend
  self.backend = Twitter

  def initialize(term)
    @term = term
  end

  def each(&block)
    tweets.each(&block)
  end

  def length
    tweets.length
  end

  private

  def tweets
    @tweets ||= backend.search(@term).results
  end
end
