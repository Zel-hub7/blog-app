# spec/support/capybara.rb

require 'capybara/rails'
require 'capybara/rspec'
require 'rack/test'

Capybara.configure do |config|
  config.default_driver = :rack_test
end
