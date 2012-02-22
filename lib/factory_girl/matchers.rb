require 'factory_girl/matchers/base'
require 'factory_girl/matchers/be_built_by_factory'
require 'factory_girl/matchers/be_created_by_factory'

module Rails
  module Example
    class ModelExampleGroup
      include FactoryGirl::Matchers
    end
  end
end

