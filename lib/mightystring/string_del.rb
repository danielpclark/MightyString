# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

# Del : Delete by index/slice
module Del
    module String
    	# Del : Delete by index/slice
        def del(in_srch = nil)
        	if not in_srch.nil?
        		if in_srch.is_a?(Range) and in_srch.first.is_a?(Integer) and in_srch.last.is_a?(Integer)
        			if not self[in_srch.first].nil? and not self[in_srch.last-1].nil?
        				if in_srch.first < 0
        					in_srch = self[0..in_srch.first-1].length..in_srch.last
        				end
        				if in_srch.last < 0
        					in_srch = in_srch.first..self[0..in_srch.last].length
        				end
        				if in_srch.first < in_srch.last
        					if in_srch.first == 0
        						return self[in_srch.last+1..-1]
        					elsif in_srch.last == self.length
        						return self[0..in_srch.first-1]
        					else
        						return self[0..in_srch.first-1] + self[in_srch.last+1..-1]
        					end
        				else
        					raise Exception.new("Invalid Range Provided!")
        				end
        			else
        				raise Exception.new("Index Out of Range!")
        			end
        		elsif in_srch.is_a?(Integer) and -self.length-1 < in_srch and in_srch < self.length
        			if in_srch == -1
        				in_srch = self.length-1
				elsif in_srch < -1 and not self[in_srch].nil?
					in_srch = self.length + in_srch
				end
        			if in_srch == 0
        				return self[(in_srch+1)..self.length]
        			else
        				return self[0..in_srch-1] + self[(in_srch+1)..self.length]
        			end
        		elsif in_srch.is_a?(String) and not in_srch.empty?
        			return self.split(in_srch).join
        		end
		end
		return nil
	end
    end
end
