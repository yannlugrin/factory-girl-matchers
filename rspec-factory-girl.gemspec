# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-factory-girl}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yann Lugrin"]
  s.date = %q{2009-03-17}
  s.email = %q{yann.lugrin@sans-savoir.net}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/spec", "lib/spec/factory_girl", "lib/spec/factory_girl/matchers.rb", "lib/spec/factory_girl/matchers", "lib/spec/factory_girl/matchers/be_builded_by_factory.rb", "lib/spec/factory_girl/matchers/base.rb", "lib/spec/factory_girl/matchers/be_created_by_factory.rb", "lib/spec/factory_girl.rb", "spec/factory_girl_spec.rb", "spec/test.sqlite3", "spec/spec.opts", "spec/spec_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yannlugrin/rspec-factory-girl}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Rspec matcher collection for testing your model builded with factory girl}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
