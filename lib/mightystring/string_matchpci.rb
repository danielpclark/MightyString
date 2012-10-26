# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

# Match Partial Case-Insensitive
module Match_PCI
    module String
    	# Match Partial Case-Insensitive: Usage: "My string has this?".matchpci('RinG') => true
        def match_pci(in_srch = "")
        	if not in_srch.empty?
			return !self.find_all{|item| item.downcase.include?(in_srch.downcase)}.empty?
		end
		return false
	end
    end
end
