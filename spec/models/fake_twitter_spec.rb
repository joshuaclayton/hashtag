require 'spec_helper'

describe FakeTwitter do
  it 'allows assignment and retrieval of tweets' do
    FakeTwitter['key'] = [{ text: 'awesome tweet text' }]
    results = FakeTwitter.search('key').results
    expect(results.length).to eq 1
    expect(results.first).to be_a Twitter::Tweet
  end

  it 'returns an empty array for an undefined search term' do
    results = FakeTwitter.search('undefined search term').results
    expect(results.length).to be_zero
  end

  it 'clears search results' do
    FakeTwitter['key'] = [{ text: 'awesome tweet text' }]
    FakeTwitter.clear
    expect(FakeTwitter.search('key').results).to be_empty
  end
end
