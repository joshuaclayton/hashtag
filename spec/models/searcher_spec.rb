require 'spec_helper'

describe Searcher do
  context 'with a different .search_object' do
    it 'uses the correct search object when assigned' do
      Searcher.search_object = stub("stubbed search object", :search => [1, 2, 3, 4])
      Searcher.new('search term').search.should == [1, 2, 3, 4]
    end
  end

  it 'returns the correct results' do
    tweets = [1, 2, 3]
    Twitter.stubs(:search => tweets)
    Searcher.new('#rails').search.should == tweets
  end

  it 'searches Twitter with the given term' do
    Twitter.stubs(:search)
    Searcher.new('#rails').search
    Twitter.should have_received(:search).with('#rails')
  end
end
