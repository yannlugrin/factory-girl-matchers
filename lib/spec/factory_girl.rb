require 'spec/factory_girl/be_builded_by_factory'
require 'spec/factory_girl/be_created_by_factory'

module Spec
  module Rails
    module Example
      class ModelExampleGroup
        include Spec::FactoryGirl::Matchers
      end
    end
  end
end