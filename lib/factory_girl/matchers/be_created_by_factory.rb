module FactoryGirl
  module Matchers
    class BeCreatedByFactory < FactoryGirl::Matchers::Base
      def description
        "create instance of '#{@target}' by factory '#{@factory}'"
      end

      def matches?(target)
        prepare_matches(target)
        begin
          @result = ::FactoryGirl.create(@factory)
        rescue ActiveRecord::RecordInvalid => e
          @errors << e.to_s
          return false
        end

        super
      end

      def failure_message_for_should
        "expected #{@target.inspect} to be created by factory '#{@factory}'\n" + @errors.join("\n")
      end

      def failure_message_for_should_not
        "expected #{@target.inspect} not to be created by factory '#{@factory}'"
      end
    end

    def be_created_by_factory(factory = nil)
      FactoryGirl::Matchers::BeCreatedByFactory.new(factory)
    end
  end
end

