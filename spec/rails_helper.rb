ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/cassettes"
  config.hook_into :webmock
  config.ignore_request do |request|
    URI(request.uri).host == '127.0.0.1'
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    SimpleCov.start 'rails'
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    clear_vcrs
  end

  def clear_vcrs
    `rm fixtures/cassettes/new.yml`
    `rm fixtures/cassettes/nope.yml`
  end

end
