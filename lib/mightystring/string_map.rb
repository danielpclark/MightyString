# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com
require 'forwardable'

module Map
  module String
    extend Forwardable

    def self.included(base)
      base.send :extend, Forwardable
    end

    # Map for String
    delegate map: :chars
    delegate map!: :chars
    delegate flat_map: :chars
  end
end