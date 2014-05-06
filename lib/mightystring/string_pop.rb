# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com


module Pop
    module String
    	# Pop character from String
        def pop
        	x = self[-1]
            self.replace self.chop
            return x
    	end
    end
end
