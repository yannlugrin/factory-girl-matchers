module Spec
  module FactoryGirl
    module Matchers
      class BeBuildedByFactory < Spec::FactoryGirl::Matchers::Base
        def description
          "build instance of '#{@target}' by factory '#{@factory}'"
        end

        def matches?(target)
          prepare_matches(target)
          
          @result = Factory.build(@factory)
          
          super
        end

        def failure_message
          "expected #{@target.inspect} to be build by factory '#{@factory}'\n" + @errors.join("\n")
        end

        def negative_failure_message
          "expected #{@target.inspect} not to be build by factory '#{@factory}'"
        end
      end

      def be_builded_by_factory(factory = nil)
        BeBuildedByFactory.new(factory)
      end
    end
  end
end