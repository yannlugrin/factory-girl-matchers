Factory Girl Matchers
=====================

[![Build Status](https://secure.travis-ci.org/yannlugrin/factory-girl-matchers.png?branch=master)](http://travis-ci.org/yannlugrin/factory-girl-matchers?branch=master)

Test::Unit- and RSpec-compatible one-liners that test your factories build with Factory Girl

```ruby
  describe Post do
    it { should be_built_by_factory } # Factory named ':post' is used
    it { should be_created_by_factory } # Factory named ':post' is used

    it { should be_built_by_factory(:my_factory) }
    it { should be_created_by_factory(:my_factory) }
  end
```

Installation
------------

```shell
gem install factory-girl-matchers
```
or add the following line to Gemfile:

```ruby
gem 'factory-girl-matchers'
```
and run `bundle install` from your shell.

More Information
----------------

* [Rubygems](https://rubygems.org/gems/factory-girl-matchers)
* [Code](http://www.github.com/yannlugrin/factory-girl-matchers)
* [Issues](https://github.com/yannlugrin/factory-girl-matchers/issues)

Copyright & License
-------------------

Copyright (c) 2012 Yann Lugrin. See LICENSE for details.

