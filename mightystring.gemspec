# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mightystring/version"

Gem::Specification.new do |s|
  s.name        = 'mightystring'
  s.version     = MightyString::VERSION
  s.license    = 'MIT'
  s.summary     = "Strings (are) Arrays with Matching, Indexing, Substitution, Deletion, and more."
  s.description = "Array functionality in Strings as well as Matching, Indexing, Substitution, Deletion, and more."
  s.authors     = ["Daniel P. Clark / 6ftDan(TM)"]
  s.email       = ["6ftdan@gmail.com"]
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    = 'http://www.github.com/danielpclark/mightystring'
  s.platform    = 'ruby'
  s.bindir      = 'bin'
  s.executables = 'ms-striphtml'
  s.require_paths = ['lib']
  s.test_files  = ["test/mightystring_test.rb"]
  s.required_ruby_version = '>= 1.8'

  s.add_development_dependency "bundler", "~> 1.11"
  s.add_development_dependency "rake", "~> 10.5"
  s.add_development_dependency "minitest", "~> 5.8"
  s.add_development_dependency "minitest-reporters", "~> 1.1"
  s.add_development_dependency "color_pound_spec_reporter", "~> 0.0.5"
end
