# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com
require 'forwardable'

module Find
  module String
    extend Forwardable

    def self.included(base)
      base.send :extend, Forwardable
    end

    # Enumerator for String
    delegate find: :chars
    delegate find_index: :chars
    delegate find_all: :chars
  end
end