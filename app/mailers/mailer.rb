class Mailer < ActionMailer::Base
  def welcome
    mail to: 'josh@thoughtbot.com', subject: 'Welcome to the Site!'
  end
end
