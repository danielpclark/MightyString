# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

# Example acceptable charachters = (Range.new('a','z').to_a + Range.new('A','Z').to_a + Range.new('0','9').to_a + ['.','-','_',"'",'"',',']).flatten

# Strip by Acceptable Characters
module StripbyAC
    module String
    	# Strip by Acceptable Characters : String.stripbyac(charlist) => Copy of New String (removes any character not in list)
        def strip_byac(acceptchars)
        	if not acceptchars.nil?
        		if acceptchars.is_a?(String)
        			return self.split('').map!{|x| if acceptchars.split('').include?(x); x end }.join
        		elsif acceptchars.is_a?(Array)
        			return self.split('').map!{|x| if acceptchars.include?(x); x end }.join
        		elsif acceptchars.respond_to?(:[])
        			acceptchars = acceptchars.to_a
        			return self.split('').map!{|x| if acceptchars.include?(x); x end }.join        		
        		else
        			raise "#{puts acceptchars.class}"
        		end
        	else
        		raise StandardError.new('You must include a list of acceptable characters for this string in stripbyac(acceptchars)!')
		end
	end
    end
end
