require 'spec_helper'

describe Searcher do
  context 'each' do
    it 'iterates over each search result' do
      stub_searcher 15.times.map { { text: '#ruby is great' } }

      searcher = Searcher.new('#ruby')

      searcher.each do |result|
        expect(result.text).to match /#ruby/i
      end

      expect(searcher.count).to eq 15
    end
  end

  context 'search_api' do
    it 'allows overriding the search API' do
      api_fake = stub_searcher([])
      api_fake.stubs(search: stub('results', results: []))
      Searcher.new('term').to_a

      api_fake.should have_received(:search).with('term')
    end
  end

  def stub_searcher(tweets)
    Searcher.search_api = FakeTwitter.new(tweets)
  end
end
