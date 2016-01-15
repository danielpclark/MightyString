# MightyString
by Daniel P. Clark

[![Gem Version](https://badge.fury.io/rb/mightystring.svg)](http://badge.fury.io/rb/mightystring)


*Description:* Add Array functionality to Strings and other tools for Strings: Matching, Indexing, Substitution, Deletion, and more.

Install: `gem install mightystring`

*Pain points this aims to solve*
 * After working with Python, it's obvious Ruby strings are lacking... so lets spiff them up.
 * Strings are Arrays... I mean really, think about it.  This works toward making Strings function as Arrays.
 * Also this provides additional string tools under MightyString... like parsing HTML into text.

*My method*
 * I believe code should be beautiful, simple, and well rounded.  I've come to expect strings to be handled easily like arrays.  There's no reason why not.  So I've brought that reality to Ruby.

*Some tools to consider here*
 * MightyString::HTML.text provides a more ideal HTML to ASCII formatting output.  This is an advanced block "filtering" module.  It works very well with, currently, extremely rare cases that fall through it's fingers.  Regardless it's beautiful, and will strive to be more so.
 
*Advanced detail*
 * Look at the test/mightystring_test.rb for case usages of each feature.

> NOTES: Implementing the flatten and join methods on String breaks functionality within Rails and Rubygems so this has been avoided.
