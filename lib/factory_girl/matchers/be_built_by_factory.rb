module FactoryGirl
  module Matchers
    class BeBuiltByFactory < FactoryGirl::Matchers::Base
      def description
        "build instance of '#{@target}' by factory '#{@factory}'"
      end

      def matches?(target)
        prepare_matches(target)
        @result = ::FactoryGirl.build(@factory)

        super
      end

      def failure_message_for_should
        "expected #{@target.inspect} to be build by factory '#{@factory}'\n" + @errors.join("\n")
      end

      def failure_message_for_should_not
        "expected #{@target.inspect} not to be build by factory '#{@factory}'"
      end
    end

    def be_built_by_factory(factory = nil)
      FactoryGirl::Matchers::BeBuiltByFactory.new(factory)
    end
  end
end

