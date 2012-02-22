# Parts of this code is extracted from Shoulda matcher licencied
# under MIT with following copyright:
# Copyright (c) 2007, Tammer Saleh, Thoughtbot, Inc.
module ModelBuilder

  def self.included(example_group)
    example_group.class_eval do
      before do
        @created_tables ||= []
      end

      after { teardown_defined_constants }
    end
  end

  def create_table(table_name, options = {}, &block)
    connection = ActiveRecord::Base.connection

    begin
      connection.execute("DROP TABLE IF EXISTS #{table_name}")
      connection.create_table(table_name, options, &block)
      @created_tables << table_name
      connection
    rescue Exception => e
      connection.execute("DROP TABLE IF EXISTS #{table_name}")
      raise e
    end
  end

  def define_constant(class_name, base, &block)
    class_name = class_name.to_s.camelize

    klass = Class.new(base)
    Object.const_set(class_name, klass)
    klass.unloadable

    klass.class_eval(&block) if block_given?
    klass.reset_column_information if klass.respond_to?(:reset_column_information)

    klass
  end

  def define_model_class(class_name, &block)
    define_constant(class_name, ActiveRecord::Base, &block)
  end

  def define_model(name, columns = {}, &block)
    class_name = name.to_s.pluralize.classify
    table_name = class_name.tableize

    create_table(table_name) do |table|
      columns.each do |name, type|
        table.column name, type
      end
    end

    define_model_class(class_name, &block)
  end

  def teardown_defined_constants
    ActiveSupport::Dependencies.clear

    @created_tables.each do |table_name|
      ActiveRecord::Base.
        connection.
        execute("DROP TABLE IF EXISTS #{table_name}")
    end
    @created_tables.clear
  end
end

