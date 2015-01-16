# Mighty String - HTML to text parser
#
# TODO *FIXME* A rare href exception gets by, as well as some comment cases, only if math_by_space is enabled. 0.1 11-27-2012 "Release Version" 
# TODO FEATURE: Split all lines in document and make sure only one blank new-line is permitted.
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

require 'string_match_pci' unless defined? Match_PCI
require 'string_index_all' unless defined? Index_All

# END REQUIRE #
class String
    include Index_All::String
    include Match_PCI::String
end

module MightyString
	module HTML
    def self.text(htmlstr, options = {})
      options[:mappings] = default_options[:mappings].
        merge(options.delete(:mappings)) if options.has_key?(:mappings)
      options = default_options.merge(options)
      options[:tag_markers].each { |g|
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
            if not (options[:math_by_space] and not html_math_exceptions(htmlstr[sh_start,sh_end - sh_start + 1]) == 0)
              htmlstr = strip_first_seq( htmlstr, htmlstr[sh_start,sh_end - sh_start + 1], options[:mappings])
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
		def self.strip_first_seq( mstr = "", mseq = "", cmpchar = default_options[:mappings] )
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


    # <b>DEPRECATED:</b> Please use <tt>MightyString::HTML.text</tt> instead.
		# Pick tags/blocks of string to remove (ex: "&", ";" like in "&quot;" can become "" or "'" if rules set))
    def self.strip_html( htmlstr = "", xarg = default_options[:tag_markers] ) # xarg start, end
      warn "#{Kernel.caller.first} [DEPRECATED] `MightyString::HTML.strip_html` is depreciated. Please use MightyString::HTML.text instead."
      text(htmlstr, :tag_markers => xarg)
		end

    def self.default_options
      {
        :tag_markers => [["<",">"],["&",";"]],
        :mappings => {
          "&quot;"=>"'","br"=>"\n","&#39;" => "'", "&nbsp;" => " ", "&trade;" => "(TM)", "&copy;" => "(c)"
        },
        :math_by_space => false,
        :drop_styles => true, # TODO Add this feature
        :drop_scripts => true, # TODO Add this feature
        :drop_iframes => false, # TODO Add this feature
        :permitted_blank_line_rows => 1, # TODO Add this feature
        :images_to_alt_text => false # TODO Add this feature
      }
    end

	end # module Strip_HTML
end # MightyString
