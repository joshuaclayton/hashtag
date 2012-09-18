require 'spec_helper'

describe Searcher, 'each' do
  it 'iterates over each search result' do
    searcher = Searcher.new('#ruby')

    searcher.each do |result|
      expect(result.text).to match /#ruby/i
    end

    expect(searcher.count).to eq 15
  end
end

describe Searcher, 'search_api' do
  around do |example|
    old_search_api = Searcher.search_api
    example.run # may change search_api
    Searcher.search_api = old_search_api
  end

  it 'allows overriding the search API' do
    results = stub('Search results', results: [])
    api_fake = stub('Fake API Searcher', search: results)
    Searcher.search_api = api_fake

    Searcher.new('term').to_a

    api_fake.should have_received(:search).with('term')
  end
end
