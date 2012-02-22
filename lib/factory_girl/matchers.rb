require 'factory_girl/matchers/be_built_by_factory'
require 'factory_girl/matchers/be_created_by_factory'

if defined?(RSpec)
  require 'factory_girl/matchers/integrations/rspec'
else
  require 'factory_girl/matchers/integrations/test_unit'
end

