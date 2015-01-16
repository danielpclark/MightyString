$:.push File.expand_path("../lib", __FILE__)
require "mightystring/version"

Gem::Specification.new do |s|
  s.name        = 'mightystring'
  s.version     = MightyString::VERSION
  s.licenses    = ['The MIT License (MIT)']
  s.summary     = "Strings (are) Arrays with Matching, Indexing, Substitution, Deletion, and more."
  s.description = "Array functionality in Strings as well as Matching, Indexing, Substitution, Deletion, and more."
  s.authors     = ["Daniel P. Clark / 6ftDan(TM)"]
  s.email       = 'webmaster@6ftdan.com'
  s.files       = ['lib/mightystring/string_at.rb',
                   'lib/mightystring/string_del.rb',
                   'lib/mightystring/string_each.rb',
                   'lib/mightystring/string_fetch.rb',
                   'lib/mightystring/string_find.rb',
                   'lib/mightystring/string_first.rb',
                   'lib/mightystring/string_index_all.rb',
                   'lib/mightystring/string_join.rb',
                   'lib/mightystring/string_last.rb',
                   'lib/mightystring/string_map.rb',
                   'lib/mightystring/string_match_pci.rb',
                   'lib/mightystring/string_pop.rb',
                   'lib/mightystring/string_push.rb',
                   'lib/mightystring/string_shift.rb',
                   'lib/mightystring/string_sort.rb',
                   'lib/mightystring/string_strip_byac.rb',
                   'lib/mightystring/string_unshift.rb',
                   'lib/mightystring/strip_html.rb',
                   'lib/mightystring/version.rb',
                   'lib/mightystring/string_method_missing.rb',
                   "lib/mightystring.rb","test/test_ms.rb",
                   "README.md","LICENSE","bin/ms-striphtml" ]
  s.homepage    = 'http://www.github.com/danielpclark/mightystring'
  s.platform    = 'ruby'
  s.bindir      = 'bin'
  s.executables = 'ms-striphtml'
  s.require_paths = ['lib']
  s.test_files  = ["test/test_ms.rb"]
  s.required_ruby_version = '>= 1.8'
end
