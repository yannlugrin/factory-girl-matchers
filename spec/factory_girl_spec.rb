require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec/factory_girl'

describe 'Factory' do
  include Spec::FactoryGirl::Matchers

  context 'with default factory name if subject is a class' do
    before(:each) do
      define_model(:simple_model)

      Factory.define :simple_model do |model|
      end
    end
    subject { SimpleModel }

    it { should be_builded_by_factory }
    it { should be_created_by_factory }
  end

  context 'with default factory name if subject is a instance' do
    before(:each) do
      define_model(:simple_model)

      Factory.define :simple_model do |model|
      end
    end
    subject { SimpleModel.new }

    it { should be_builded_by_factory }
    it { should be_created_by_factory }
  end

  context 'with specified factory name' do
    before(:each) do
      define_model(:simple_model)

      Factory.define :another_model, :class => SimpleModel do |model|
      end
    end
    subject { SimpleModel }

    it { should be_builded_by_factory(:another_model) }
    it { should be_created_by_factory(:another_model) }
  end

  context 'with another class' do
    before(:each) do
      define_model(:simple_model)
      define_model(:another_model)

      Factory.define :simple_model, :class => AnotherModel do |model|
      end
    end
    subject { SimpleModel }

    it { should_not be_builded_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'without attribute' do
    before(:each) do
      define_model(:simple_model)

      Factory.define :simple_model do |model|
      end
    end
    subject { SimpleModel }

    it { should be_builded_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'with attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string)

      Factory.define :simple_model do |model|
      end
    end
    subject { SimpleModel }

    it { should be_builded_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'without all needed attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_presence_of :name
      end

      Factory.define :simple_model do |model|
      end
    end
    subject { SimpleModel }

    it { should_not be_builded_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'with all needed attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_presence_of :name
      end

      Factory.define :simple_model do |model|
        model.name 'My name'
      end
    end
    subject { SimpleModel }

    it { should be_builded_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'without sequence for uniqu attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_uniqueness_of :name
      end

      Factory.define :simple_model do |model|
      end
      Factory.create :simple_model
    end
    subject { SimpleModel }

    it { should_not be_builded_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'with sequence for uniqu attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_uniqueness_of :name
      end

      Factory.define :simple_model do |model|
        model.sequence(:name) {|n| "name #{n}" }
      end
      Factory.create :simple_model
    end
    subject { SimpleModel }

    it { should be_builded_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end
end

