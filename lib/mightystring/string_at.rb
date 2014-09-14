# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com
require 'forwardable'

# At
module At
  module String
    extend Forwardable

    def self.included(base)
      base.send :extend, Forwardable
    end

    # At : Returns string instead of char number.
    def at(in_srch = nil)
      if in_srch.is_a?(Integer)
        return self[in_srch..in_srch]
      end
      return nil
    end

    delegate values_at: :chars
    delegate delete_at: :chars
  end
end
