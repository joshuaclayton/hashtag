require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
