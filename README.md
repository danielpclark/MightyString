##MightyString
[![Build Status](https://travis-ci.org/danielpclark/MightyString.svg?branch=crystal)](https://travis-ci.org/danielpclark/MightyString)

Powerful methods for your strings.

This is a partially ported version of the Ruby gem "mightystring" over to Crystal.  Not nearly as
much functionality is provided but hopefully these methods will still be found useful!

##Install

Add this shard you your shard.yml file.

```
dependencies:
  mightystring:
    github: danielpclark/mightystring
    branch: crystal
```

And install your dependencies with `crystal deps`.  Then add `require "mightystring"` where you need it.

##Usage

```ruby
# String#del
"asdfasdf".del(0..2)
# => "fasdf"
"asdfasdf".del(1)
# => "adfasdf"
"asdfasdf".del([1,3])
# => "adasdf"
"asdfasdf".del("a")
# => "sdfsdf"

# String#first
"asdf".first
# => "a"

# String#last
"asdf".last
# => "f"

# String#sort
str = "asdf"
str.sort
# => "adfs"
str
# => "asdf"

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

# String#head
"asdf".head
# => "a"
"asdf".head(3)
# => "asd"

# String#tail
"asdf".tail
# => "sdf"
"asdf".tail(3)
# => "f"

# String#bhead and String#bisect_head
"asdf".bhead
# => ["a", "sdf"]
"asdf".bhead(3)
# => ["asd", "f"]

# String#btail and String#bisect_tail
"asdf".btail
# => ["sdf", "a"]
"asdf".btail(3)
# => ["f", "asd"]
```
