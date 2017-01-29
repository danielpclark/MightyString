
module MightyString
  module String
    def bhead(*args)
      bisect_head(*args)
    end

    def btail(*args)
      bisect_tail(*args)
    end

    def first(*args)
      "#{chars.first(*args)}"
    end

    def last(*args)
      "#{chars.last(*args)}"
    end

    def values_at(*args) 
      chars.values_at(*args).join.split("")
    end

    def del(indexes : Int32 | Array(Int32) | Range(Int32, Int32) | ::String)
      case indexes
      when String then split(indexes).join
      else
        if indexes.is_a?(Int32)
          indexes = [indexes]
        end
        each_char.with_index.
          reduce([] of Char) {|arr,(c,i)|
            arr << c unless indexes.includes?(i)
            arr
          }.join
      end
    end

    def head(offset = 1)
      self[0...offset]
    end

    def bisect_head(offset = 1)
      [head(offset), tail(offset)]
    end

    def index_all(matcher)
      arr_indexes = [] of Int32
      srch_index = rindex(matcher)
      while srch_index
        tmpStr = self[0..srch_index-1]
        arr_indexes << srch_index 
        srch_index = srch_index.==(0) ? nil : tmpStr.rindex(matcher)
      end
      arr_indexes.reverse
    end

    def sift(chars_to_keep)
      chars_to_keep = case chars_to_keep
                      when String then chars_to_keep.chars
                      when Array  then chars_to_keep
                      when Range  then chars_to_keep.to_a
                      else
                        raise Exception.new("Invalid parameter")
                      end
      chars.select {|chr|
        chars_to_keep.includes?({chr}.join)
      }.join
    end

    def sort
      chars.sort.join
    end

    def tail(offset = 1)
      self[offset..-1]
    end

    def bisect_tail(offset = 1)
      [tail(offset), head(offset)]
    end

    def unshift(str)
      replace str.+(self)
    end
  end
end
