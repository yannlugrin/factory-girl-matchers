require 'rubygems'
require 'rspec'
require 'active_record'
require 'factory_girl'
require 'factory_girl/matchers'

# Load support files
Dir[File.expand_path(File.join('..', 'support', '**', '*.rb'), __FILE__)].each { |file| require(file) }

# Establish connection to database
config = {
  :database => {
    :adapter => 'sqlite3',
    :database => File.expand_path(File.join(File.dirname(__FILE__), 'test.sqlite3')),
    :pool => 5,
    :timeout => 5000
  }
}
ActiveRecord::Base.establish_connection(config[:database])

# Rspec config
RSpec.configure do |config|
  config.filter_run :focus => true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  config.before(:each) do
    FactoryGirl.reload
  end

  config.include ModelBuilder
  config.include FactoryGirl::Matchers
end

