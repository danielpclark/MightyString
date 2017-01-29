require "./mightystring/string"
require "./mightystring/version"

module MightyString
  class ::String
    include MightyString::String
  end
end
