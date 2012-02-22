require 'spec_helper'

describe 'Factory' do

  context 'with default factory name if subject is a class' do
    before(:each) do
      define_model(:simple_model)

      FactoryGirl.define do
        factory :simple_model
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory }
    it { should be_created_by_factory }
  end

  context 'with default factory name if subject is a instance' do
    before(:each) do
      define_model(:simple_model)

      FactoryGirl.define do
        factory :simple_model
      end
    end
    subject { SimpleModel.new }

    it { should be_built_by_factory }
    it { should be_created_by_factory }
  end

  context 'with specified factory name' do
    before(:each) do
      define_model(:simple_model)

      FactoryGirl.define do
        factory :another_model, :class => SimpleModel
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory(:another_model) }
    it { should be_created_by_factory(:another_model) }
  end

  context 'with another class' do
    before(:each) do
      define_model(:simple_model)
      define_model(:another_model)

      FactoryGirl.define do
        factory :simple_model, :class => AnotherModel
      end
    end
    subject { SimpleModel }

    it { should_not be_built_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'without attribute' do
    before(:each) do
      define_model(:simple_model)

      FactoryGirl.define do
        factory :simple_model
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'with attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string)

      FactoryGirl.define do
        factory :simple_model
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'without all needed attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_presence_of :name
      end

      FactoryGirl.define do
        factory :simple_model
      end
    end
    subject { SimpleModel }

    it { should_not be_built_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'with all needed attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates_presence_of :name
      end

      FactoryGirl.define do
        factory :simple_model do
          name 'My Name'
        end
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end

  context 'without sequence for unique attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates :name, :uniqueness => true, :presence => true
      end

      FactoryGirl.define do
        factory :simple_model do
          name 'My Name'
        end
      end
    end
    subject { SimpleModel }

    it { should_not be_built_by_factory(:simple_model) }
    it { should_not be_created_by_factory(:simple_model) }
  end

  context 'with sequence for unique attribute' do
    before(:each) do
      define_model(:simple_model, :name => :string) do
        validates :name, :uniqueness => true, :presence => true
      end

      FactoryGirl.define do
        factory :simple_model do
          sequence(:name) {|n| "My Name #{n}" }
        end
      end
    end
    subject { SimpleModel }

    it { should be_built_by_factory(:simple_model) }
    it { should be_created_by_factory(:simple_model) }
  end
end

