# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com


module UnShift
    module String
    	# Unshift from start of String
        def unshift(x)
        	self.replace x.to_s + self
    	end
    end
end
