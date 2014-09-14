# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com
require 'forwardable'

module Each
  module String
    extend Forwardable

    def self.included(base)
      base.send :extend, Forwardable
    end

    # Enumerator for String
    delegate each: :chars
    delegate each_index: :chars
    delegate each_with_index: :chars
    delegate each_entry: :chars
    delegate each_slice: :chars
    delegate each_cons: :chars
    delegate each_with_object: :chars
    delegate reverse_each: :chars
  end
end