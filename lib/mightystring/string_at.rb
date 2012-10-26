# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

# At
module At
    module String
    	# At : Returns string instead of char number.
        def at(in_srch = nil)
        	if in_srch.is_a?(Integer)
			return self[in_srch..in_srch]
		end
		return nil
	end
    end
end
