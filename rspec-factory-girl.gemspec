# encoding: utf-8
$:.push File.expand_path('..', __FILE__)
require 'lib/spec/factory_girl/version'

Gem::Specification.new do |s|
  s.name        = 'rspec-factory-girl'
  s.version     = Spec::FactoryGirl::VERSION
  s.authors     = ['Yann Lugrin']
  s.email       = 'yann.lugrin@sans-savoir.net'
  s.homepage    = 'http://rubygems.org/gems/rspec-factory-girl'
  s.summary     = 'Rspec matcher collection for testing your model built with factory girl'
  s.description = 'Rspec matcher collection for testing your model built with factory girl'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'rspec-factory-girl'

  s.add_dependency 'rspec'
  s.add_dependency 'factory_girl'

  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'sqlite3'

  s.files        = Dir.glob('{lib}/**/*') + %w[LICENSE README.rdoc]
  s.require_path = 'lib'

  s.rdoc_options = ['--charset=UTF-8', '--main=README.rdoc', "--exclude='(lib|test|spec)|(Gem|Guard|Rake)file'"]
end

