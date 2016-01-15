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
      if not cmpchar.empty? and cmpchar.keys.any? {|mkey| mseq.downcase[mkey.downcase] } # keys exist and one of the keys match
        cmpchar.each_key { |mkey|
          if mseq.downcase[mkey.downcase]
            mstr = mstr[0,mstr.index(mseq)] + cmpchar[mkey] + mstr[(mstr.index(mseq)+mseq.length)..-1]
          end
        }
      elsif mstr.index(mseq)
        mstr = mstr[0,mstr.index(mseq)] + mstr[(mstr.index(mseq)+mseq.length)..-1]
      end
      return mstr
    end

    def self.default_options
      {
        :tag_markers => [["<",">"],["&",";"]],
        :mappings => {
          "&quot;"=>"'","br"=>"\n","&#39;" => "'", "&nbsp;" => " ", "&trade;" => "(TM)", "&copy;" => "(c)"
        },
        :math_by_space => false # FIXME certain (long) A href tags slip through
      }
    end

  end # module Strip_HTML
end # MightyString
