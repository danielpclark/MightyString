require 'mightystring/string_at'
require 'mightystring/string_del'
# require 'mightystring/string_each'
require 'mightystring/string_fetch'
# require 'mightystring/string_find'
require 'mightystring/string_first'
require 'mightystring/string_index_all'
require 'mightystring/string_join'
require 'mightystring/string_last'
require 'mightystring/string_map'
require 'mightystring/string_match_pci'
require 'mightystring/string_pop'
require 'mightystring/string_push'
require 'mightystring/string_shift'
require 'mightystring/string_sort'
require 'mightystring/string_strip_byac'
require 'mightystring/string_unshift'
require 'mightystring/strip_html'
require 'mightystring/version'
#require 'mightystring/string_method_missing'

class String
  include At::String
  include Del::String
# include Each::String
  include Fetch::String
# include Find::String
  include First::String
  include Index_All::String
  include Join::String
  include Last::String
  include Map::String
  include Match_PCI::String
  include Pop::String
  include Push::String
  include Shift::String
  include Sort::String
  include Strip_byAC::String
  include UnShift::String
  #include MethodMissing::String
end