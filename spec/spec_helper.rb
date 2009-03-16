require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'activerecord'
require 'factory_girl'

# Configuration information
config = {
  :database => {
    :adapter => 'sqlite3',
    :database => File.expand_path(File.join(File.dirname(__FILE__), 'test.sqlite3')),
    :pool => 5,
    :timeout => 5000
  }
}

# Establish connection to database
ActiveRecord::Base.establish_connection(config[:database])

# Rspec config
Spec::Runner.configure do |config|
end

# Helpers to create models
def create_table(table_name, &block)
  connection = ActiveRecord::Base.connection

  begin
    connection.execute("DROP TABLE IF EXISTS #{table_name}")
    connection.create_table(table_name, &block)
    @created_tables ||= []
    @created_tables << table_name
    connection
  rescue Exception => e
    connection.execute("DROP TABLE IF EXISTS #{table_name}")
    raise e
  end
end

def define_model_class(class_name, &block)
  klass = Class.new(ActiveRecord::Base)

  silence_warnings do
    Object.const_set(class_name, klass)
  end

  klass.class_eval(&block) if block_given?

  @defined_constants ||= []
  @defined_constants << class_name

  klass
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
