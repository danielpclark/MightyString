# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

module MethodMissing
  module String

    def method_missing(meth,*args, &block)
      if self.chars.respond_to? meth
        self.chars.send meth, *args, &block
      else
        super
      end
    end

    def respond_to?(meth)
      if self.chars.respond_to? meth
        true
      else
        super
      end
    end

  end
end