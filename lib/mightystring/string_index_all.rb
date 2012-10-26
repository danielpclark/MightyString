# Part of MightyString
# by Daniel P. Clark
# webmaster@6ftdan.com

# Index_All
module Index_All
	module String
	# find_all(search string): Returns indexes of search string as an index array.
		def index_all(in_srch = "")
			in_srch = in_srch.to_s
			if not in_srch.empty?
				arr_indexes = []
				srch_index = self.rindex(in_srch)
				while not srch_index.nil? do
					tmpStr = self[0..srch_index-1]
					arr_indexes += [srch_index] # Put it in the list
					if srch_index == 0
						srch_index = nil
					else
						srch_index = tmpStr.rindex(in_srch)
					end
				end
				return arr_indexes.reverse
			end
		end
	end
end
