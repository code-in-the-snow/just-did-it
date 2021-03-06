# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
# abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'shoulda-matchers'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
require "capybara/rspec"
require "database_cleaner"

# require "capybara/poltergeist"
# Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    # set the default
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!

#   config.include AuthenticationHelper
end
