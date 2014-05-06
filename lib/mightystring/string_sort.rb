# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com


module Sort
    module String
    	# Return sorted String
        def sort
        	return self.split("").sort.join
    	end
    	# Sort String
    	def sort!
        	self.replace self.split("").sort.join
    	end
    end
end
