$:.push File.expand_path("../lib", __FILE__)
require "mightystring/version"

Gem::Specification.new do |s|
  s.name        = 'mightystring'
  s.version     = MightyString::VERSION
  s.licenses    = ['The MIT License (MIT)']
  s.summary     = "Strings (are) Arrays & Matching, Indexing, Substitution, Deletion, and more."
  s.description = "Array functionality in Strings as well as Matching, Indexing, Substitution, Deletion, and more."
  s.authors     = ["Daniel P. Clark / 6ftDan(TM)"]
  s.email       = 'webmaster@6ftdan.com'
  s.files       = ["lib/mightystring/string_stripbyac.rb", "lib/mightystring/string_matchpci.rb",
  "lib/mightystring/string_del.rb", "lib/mightystring/string_index_all.rb", "lib/mightystring/version.rb",
  "lib/mightystring/strip_html.rb", "lib/mightystring/string_at.rb", "lib/mightystring.rb","test/test_ms.rb",
  "README","LICENSE","bin/ms-striphtml" ]
  s.homepage    = 'http://www.github.com/danielpclark/mightystring'
  s.platform    = 'ruby'
  s.bindir      = 'bin'
  s.executables = 'ms-striphtml'
  s.post_install_message = "Enjoy the power your Strings now have!"
  s.require_paths = ['lib']
  s.test_files  = ["test/test_ms.rb"]
end
