# -*- encoding: utf-8 -*-
require File.expand_path('../lib/miraculous/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["rafaeldx7"]
  gem.email         = ["rafaeldx7@gmail.com"]
  gem.description   = %q{Simple Rspec Matchers compatible with Remarkable gem.}
  gem.summary       = %q{Simple Rspec Matchers compatible with Remarkable gem.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "miraculous"
  gem.require_paths = ["lib"]
  gem.version       = Miraculous::VERSION

  gem.add_runtime_dependency "rails", "~> 3.1.0"
  gem.add_development_dependency "rspec", "~> 2.7.0"
end
