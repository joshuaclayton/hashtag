require 'spec_helper'

describe FakeTwitter do
  it 'behaves like Twitter for a search term' do
    FakeTwitter['#rails'] = [{ text: 'I love #rails' }]
    results = FakeTwitter.search('#rails').results

    expect(results.length).to eq 1
    expect(results.first.text).to eq 'I love #rails'
  end

  it 'does not bleed state' do
    results = FakeTwitter.search('#rails').results

    expect(results).to be_empty
  end

  it 'allows data to be cleared' do
    FakeTwitter['#rails'] = [{ text: 'I love #rails' }]
    FakeTwitter.clear

    results = FakeTwitter.search('#rails').results
    expect(results).to be_empty
  end
end
