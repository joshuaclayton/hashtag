require 'spec_helper'

describe Searcher, '.new' do
  it 'invokes search on Twitter with the correct term' do
    search = stub('Twitter search', results: [])
    Twitter.stubs(search: search)
    Searcher.new('awesomeness')
    expect(Twitter).to have_received(:search).with('awesomeness')
  end
end

describe Searcher, '#each' do
  it 'iterates over the results of a twitter search' do
    search = stub('Twitter search', results: [1, 2, 3, 4, 5])
    Twitter.stubs(search: search)

    searcher = Searcher.new('awesomeness')
    expect(searcher.length).to eq 5
  end
end

describe Searcher, '.driver=' do
  it 'uses the results from the driver search' do
    search = stub('search', results: [1, 2, 3])
    custom_driver = stub('Custom Driver', search: search)
    Searcher.driver = custom_driver

    searcher = Searcher.new('awesomeness')
    expect(searcher.to_a.length).to eq 3
  end
end
