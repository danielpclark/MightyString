[![Gem Version](https://badge.fury.io/rb/mightystring.svg)](http://badge.fury.io/rb/mightystring)

Powerful methods for your strings.

Add this to your Gemfile and then run `bundle install`.
```ruby
gem 'mightystring', '~> 1.0'
```

Or you can just install and use it manually.
```ruby
gem install mightystring
```
##Usage

```ruby
# String#at
"abc".at(0)
# => "a"
"0123456789".at(-1)
# => "9"
"vwq".at(5)
# => nil

# String#del
"asdfasdf".del(0..2)
# => "fasdf"
"asdfasdf".del(1)
# => "adfasdf"
"asdfasdf".del([1,3])
# => "adasdf"
"asdfasdf".del("a")
# => "sdfsdf"

# String#del!
str = "asdfasdf"
str.del!("sd")
str
# => "afaf"
str.del!(1..2)
str
# => "af"

# String#first
"asdf".first
# => "a"

# String#last
"asdf".last
# => "f"

# String#pop
"asdf".pop
# => "f"

# String#push
"asdf".push("r")
# => "asdfr"

# String#shift
"asdf".shift
# => "a"

# String#sort
str = "asdf"
str.sort
# => "adfs"
str
# => "asdf"

# String#sort!
str = "asdf"
str.sort!
# => "adfs"
str
# => "adfs"

# String#unshift
"asdf".unshift("r")
# => "rasdf"

# String#values_at
"asdfasdfasdf".values_at(0,5,-1)
# => ["a", "s", "f"]

# String#index_all
"012324507654301243".index_all( "0" )
# => [0,7,13]
"the apple is the best fruit in the world".index_all( "the" )
# => [0, 13, 31]
"asdfasdfasdf".index_all( /sd/ )
# => [1,5,9]

# String#sift
"qwertyuiop".sift( "aeiou" )
# => "euio"
"qa2ws3ed4rf5tg6yh7uj8ik9ol".sift( Range.new( "0", "9" ) )
# => "23456789"
```

##Extras
 * MightyString::HTML.text provides a more ideal HTML to ASCII formatting output.  This is an advanced block "filtering" module.  It works very well with, currently, extremely rare cases that fall through it's fingers.  Regardless it's beautiful, and will strive to be more so.
 
Look at the test/mightystring_test.rb for case usages of each feature.
