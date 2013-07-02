require 'spec_helper'

describe FakeTwitter do
  it 'allows for searching and retrieval' do
    FakeTwitter.searching_for('#rails').returns([
      { text: 'I love #rails' }
    ])

    statuses = FakeTwitter.search('#rails').results

    expect(statuses.first.text).to eq 'I love #rails'
  end

  it 'returns an empty array when no results are returned' do
    expect(FakeTwitter.search('#rails').results).to be_empty
  end
end
