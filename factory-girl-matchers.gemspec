# encoding: utf-8
$:.push File.expand_path('..', __FILE__)
require 'lib/factory_girl/matchers/version'

Gem::Specification.new do |s|
  s.name        = 'factory-girl-matchers'
  s.version     = FactoryGirl::Matchers::VERSION
  s.authors     = ['Yann Lugrin']
  s.email       = 'yann.lugrin@sans-savoir.net'
  s.homepage    = 'http://rubygems.org/gems/factory-girl-matchers'
  s.summary     = 'Making easy to validate your factories created with Factory Girl'
  s.description = 'Making easy to validate your factories created with Factory Girl'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'factory-girl-matchers'

  s.add_dependency 'rspec',         '>= 2.0'
  s.add_dependency 'factory_girl',  '>= 2.6'

  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'sqlite3'

  s.files        = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'

  s.rdoc_options = ['--charset=UTF-8', '--main=README.rdoc', "--exclude='(lib|test|spec)|(Gem|Guard|Rake)file'"]
end

