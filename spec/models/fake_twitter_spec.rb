require 'spec_helper'

describe FakeTwitter do
  it 'allows for assignment and retrieval of search results' do
    FakeTwitter['#ruby'] = ['I love #ruby']
    expect(FakeTwitter.search('#ruby').results.first.text).to eq 'I love #ruby'
  end

  it 'allows for results to be cleared' do
    FakeTwitter['#ruby'] = ['I love #ruby']
    FakeTwitter.clear
    expect(FakeTwitter.search('#ruby').results).to be_empty
  end
end
