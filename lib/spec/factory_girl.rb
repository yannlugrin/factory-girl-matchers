require 'spec/factory_girl/matchers'

module Spec
  module Rails
    module Example
      class ModelExampleGroup
        include Spec::FactoryGirl::Matchers
      end
    end
  end
end