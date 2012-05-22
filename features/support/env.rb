require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.javascript_driver = :webkit
  Capybara.default_selector = :css
  ActionController::Base.allow_rescue = false
  DatabaseCleaner.strategy = :transaction
  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
