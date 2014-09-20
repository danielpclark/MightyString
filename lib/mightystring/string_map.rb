# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com
#require 'forwardable'

module Map
  module String
    
    def map(*args, &block)
      if (!args.compact.empty? || !block.nil?)
        self.chars.map(*args,&block).join
      else
        self.chars.map(*args,&block)
      end
    end

    def map!(*args, &block)
      if (!args.compact.empty? || !block.nil?)
        self.replace self.chars.map(*args,&block).join
      else
        self.chars.map(*args,&block)
      end
    end

    def flat_map(*args, &block)
      if (!args.compact.empty? || !block.nil?)
        self.chars.flat_map(*args,&block).join
      else
        self.chars.flat_map(*args,&block)
      end
    end
  end
end