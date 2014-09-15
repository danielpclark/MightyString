require_relative 'mightystring/string_at'
require_relative 'mightystring/string_del'
require_relative 'mightystring/string_each'
require_relative 'mightystring/string_fetch'
require_relative 'mightystring/string_find'
require_relative 'mightystring/string_first'
require_relative 'mightystring/string_index_all'
require_relative 'mightystring/string_join'
require_relative 'mightystring/string_last'
require_relative 'mightystring/string_map'
require_relative 'mightystring/string_match_pci'
require_relative 'mightystring/string_pop'
require_relative 'mightystring/string_push'
require_relative 'mightystring/string_shift'
require_relative 'mightystring/string_sort'
require_relative 'mightystring/string_strip_byac'
require_relative 'mightystring/string_unshift'
require_relative 'mightystring/strip_html'
require_relative 'mightystring/version'
require_relative 'mightystring/string_method_missing'

class String
  include At::String
  include Del::String
  include Each::String
  include Fetch::String
  include Find::String
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
  include MethodMissing::String
end


class Array
  # To fix a bug that our method_missing creates
  # we need to set a MAXIMUM for FLATTEN
  alias_method :_old_flatten, :flatten
  alias_method :_old_flatten!, :flatten!

  def flatten(level = 99)
    _old_flatten(level)
  end

  def flatten!(level = 99)
    _old_flatten!(level)
  end
end