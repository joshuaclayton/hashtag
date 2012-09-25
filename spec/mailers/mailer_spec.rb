require 'spec_helper'

describe Mailer, '.welcome' do
  it 'sends it to the correct individuals' do
    expect(welcome_email).to deliver_to 'josh@thoughtbot.com'
  end

  it 'sends it with the correct subject' do
    expect(welcome_email).to have_subject 'Welcome to the Site!'
  end

  def welcome_email
    Mailer.welcome.deliver
  end
end
