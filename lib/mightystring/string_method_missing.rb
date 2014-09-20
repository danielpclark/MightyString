# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

#module MethodMissing
#  module String
#
#    def method_missing(meth,*args, &block)
#      if self.chars.respond_to? meth
#        self.chars.send meth, *args, &block
#      else
#        super
#      end
#    end
#
#    def respond_to?(meth)
#      if self.chars.respond_to? meth
#        true
#      else
#        super
#      end
#    end
#
#  end
#end

#class Array
  # To fix a bug that our method_missing creates
  # we need to set a MAXIMUM for FLATTEN
#  alias_method :_old_flatten, :flatten
#  alias_method :_old_flatten!, :flatten!
#
#  def flatten(level = 42)
#    _old_flatten(level)
#  end
#
#  def flatten!(level = 42)
#    _old_flatten!(level)
#  end
#end