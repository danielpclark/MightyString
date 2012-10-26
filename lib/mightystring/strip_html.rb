
# APP_VERSION = '0.1 11-27-2012'

# Mighty String - Strip HTML
# Ruby should be easy to read, regex is not.  I believe string block handling can be done better than rough regex'ing.
#
# TODO *FIXME* A rare href exception gets by, as well as some comment cases. 0.1 11-27-2012 "Release Version" 
#
# Ver 0.1 11-27-2012 "Release Version"
# - Modularized and Gemified
# - Fixed mathmatical exceptions. Code is completely functional with test case.
#
# Ver Pre_0.3.0 8-7-2012
# - Added String modules for a healthy and useful String library
# - Finished mathmatical and generic & exceptions
#
# Ver Pre_0.2.1
# - Fixed indexing problem when only 1 of two cases where 'paired'.  Such as '<' and not '>'.  It died previously on nil.
# - Added test case
# 
# Ver Pre_0.2
# - Added command line html file processing
# - Added case insensitivity for HTML snippets
#
# Ver Pre_0.1
# - HTML tag stripper with ASCII output

Strip_HTML_License = "

MightyString is licensed under 'The MIT License (MIT)'

Copyright (c) 2012 Daniel P. Clark & 6ft Dan(TM)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
#   REQUIRE   #
begin
	require 'string_match_pci'
	require 'string_index_all'
rescue LoadError # For test-unit
	$: << File.join(File.dirname(__FILE__), "/../lib")
	$: << File.join(File.dirname(__FILE__), "/../lib/mightystring")
	require 'string_matchpci'
	require 'string_index_all'
end
# END REQUIRE #
class String
    include Index_All::String
    include Match_PCI::String
end

module MightyString
	module HTML
		# Define some generic rules here ***
		# ---- COOL note: you can insert ASCII color escape code rules here... like for href then blue and for /a then plain
		def self.html_to_text_codes 
			{"&quot;"=>"'","br"=>"\n","&#39;" => "'", "td" => " | ", "&nbsp;" => " ", "&trade;" => "(TM)", "&copy;" => "(c)"} # replace html segment and insert plan text equivalent
		end

		def self.math_by_space
			true # if this is set then < followed by a space is considered not a html tag, like wise > with a space beforehand
		end

		# End define generic rules ***
	
		def self.html_math_exceptions(in_str = "")
			if in_str["< "] or in_str["& "]
				return 1 # Execption found at beginning
			elsif in_str["&"] and in_str[";"] and (in_str[" "] or in_str.length > 7) # Shouldn't have spaces in html &code;s or be greater than 7 in length
				return 2 # Exception found for both
			else
				return 0
			end

		end

		# strip sequence out ( master string, sequence to remove, any characters to swap inplace this for that )
		def self.strip_first_seq( mstr = "", mseq = "", cmpchar = self.html_to_text_codes )
			if not cmpchar.empty? and cmpchar.keys.any? {|mkey| mseq.match_pci(mkey) } # keys exist and one of the keys match
				cmpchar.each_key { |mkey|
					if mseq.match_pci(mkey)
						mstr = mstr[0,mstr.index(mseq)] + cmpchar[mkey] + mstr[(mstr.index(mseq)+mseq.length)..-1]
					end
				}
			elsif mstr.index(mseq)
				mstr = mstr[0,mstr.index(mseq)] + mstr[(mstr.index(mseq)+mseq.length)..-1]
			end
			return mstr
		end

		# Pick tags/blocks of string to remove (ex: "&", ";" like in "&quot;" can become "" or "'" if rules set))
		def self.strip_html( htmlstr = "", xarg = [["<",">"],["&",";"]] ) # xarg start, end
			xarg.each { |g|
				sh_endpoints = htmlstr.index_all(g[1])
				if sh_endpoints.nil?
					break
				end
				sh_end = htmlstr.rindex(g[1])
				sh_start = htmlstr.rindex(g[0])
				while !!sh_end and !!sh_start do
					if sh_end > sh_start
						sh_seq = htmlstr[sh_start,sh_end - sh_start + 1]
						until sh_seq.count(g[1]) == 1 do # until we've selected only the inner block
							sh_end = htmlstr[0,sh_end-1].rindex(g[1])
							sh_seq = htmlstr[sh_start,sh_end - sh_start + 1]
						end
						if not (math_by_space and not html_math_exceptions(htmlstr[sh_start,sh_end - sh_start + 1]) == 0)
							htmlstr = strip_first_seq( htmlstr, htmlstr[sh_start,sh_end - sh_start + 1])
						else
							sh_end = sh_end - 1
						end
					else
						sh_start = sh_start - 1
					end
					sh_end = htmlstr[0..sh_end].rindex(g[1])
					sh_start = htmlstr[0..sh_start].rindex(g[0])
				end
			}
			return htmlstr
		end

		def self.testCase
			pagesample = "<html><body>This code primarily removes (less than)tags(greater than) and (amperstand)code(semicolon).<br>This default behavior can be modified to fit your needs.<br>4>3 doesn't pair up, so it's visible.<br>As well as this with a space 4 > 3.<br>The opposite is 3 < 4.  Can you see me?<br>These following punctions don't get removed because they are out of matching order. ';and&'.<br>< This is visible because of the first space before the less than symbol. ><br>&This shows because it's longer then characters in length and has a space in it.;<br><br><table><tr><td>My Box Table</td></tr></table> <!-- <div>Old HTML commented out.  This is a unique case.<br>The code finds the innermost blocks and removes them outwards.  So something like '< !-- < tag >' or '< /tag > -- >' won't raise an error.<br>(I added the spaces so you can still see the ouput print.)</div> --><br><br><h1>Ruby is quite nice!</h1><br><a href='_blank'>http://www.6ftdan.com</a></body></html>"
			puts pagesample
			puts
			puts " * - * - * - Before test is above. - * - * - after striphtml follows - * - * - *"
			puts
			puts strip_html(pagesample)
		end
	
		def self.license
			license = "Mighty_String::Strip_HTML is licensed under 'The MIT License (MIT)'

	Copyright (c) 2012 Daniel P. Clark & 6ft Dan(TM)

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
			puts
			puts license
			puts
		end
	end # module Strip_HTML
end # MightyString
