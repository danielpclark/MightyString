require'forwardable'

module MightyString
  module String
    def self.included(base)
      base.class_eval {
        alias_method :at, :[]

        extend Forwardable
        def_delegators :chars, :first, :last, :values_at
      }
    end

    def del indexes
      case indexes
      when String then split(indexes).join
      else
        each_char.with_index.
          reduce([]) {|arr,(c,i)|
            arr << c unless Array(indexes).include?(i)
            arr
        }.join
      end
    end

    def del! indexes
      replace del(indexes)
    end

    def index_all matcher
      arr_indexes = []
      srch_index = rindex(matcher)
      while srch_index do
        tmpStr = self[0..srch_index-1]
        arr_indexes << srch_index 
        srch_index = srch_index.zero? ? nil : tmpStr.rindex(matcher)
      end
      arr_indexes.reverse
    end

    def pop
      chr = self[-1]
      replace chop
      chr 
    end

    def push str
      replace self.+(str)
    end

    def shift
      chr = self[0]
      replace self[1..-1]
      chr
    end

    def sift chars_to_keep
      chars_to_keep = case chars_to_keep
                      when String then chars_to_keep.chars
                      when Array  then chars_to_keep
                      when Range  then chars_to_keep.to_a
                      else
                        raise TypeError, "Invalid parameter"
                      end
      chars.keep_if {|chr|
        chars_to_keep.include? chr
      }.join
    end

    def sort
      chars.sort.join
    end

    def sort!
      replace sort
    end

    def unshift str
      replace str.+(self)
    end
  end
end
