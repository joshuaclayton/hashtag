require 'spec_helper'

describe Search, '.search_api=' do
  it 'assigns the value for .search_api' do
    Search.search_api = 'Thing'
    expect(Search.search_api).to eq 'Thing'
  end
end

describe Search do
  it 'iterates over each result from search_api' do
    results = stub('twitter results', results: [])
    twitter = stub('Twitter', search: results)

    Search.search_api = twitter
    searcher = Search.new('search term')

    searcher.each { }
    expect(twitter).to have_received(:search).with('search term')
  end
end

