# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com


module Shift
    module String
    	# Shift from start of String
        def shift
        	x = self[0]
        	self.replace self[1..-1]
        	return x
    	end
    end
end
