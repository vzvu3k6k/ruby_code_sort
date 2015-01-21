# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_code_sort/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_code_sort"
  spec.version       = RubyCodeSort::VERSION
  spec.authors       = ["vzvu3k6k"]
  spec.email         = ["vzvu3k6k@gmail.com"]
  spec.summary       = %q{Sorts Ruby code using parser}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "CC0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5.1"

  spec.add_runtime_dependency "parser", "~> 2.2.0.2"
end
