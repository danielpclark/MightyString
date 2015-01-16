# MightyString
by Daniel P. Clark

[![Gem Version](https://badge.fury.io/rb/mightystring.svg)](http://badge.fury.io/rb/mightystring)
[![Epic Winning](https://img.shields.io/badge/Epic-Winning-brightgreen.svg?style=flat)](https://rubygems.org/gems/mightystring)

[![Ruby Version Support](https://img.shields.io/badge/Ruby%20Version%20Support-1.8.7-red.svg?style=flat)](https://www.ruby-lang.org)


*Description:* Add Array functionality to Strings and other tools for Strings: Matching, Indexing, Substitution, Deletion, and more.

Install: `gem install mightystring -v 0.1.9`

*Pain points this solves.*
 * After working with Python, it's obvious Ruby strings are lacking... so lets spiff them up.
 * Strings are Arrays... I mean really, think about it.  This works toward making Strings function as Arrays.
 * Also this provides additional string tools under MightyString... like parsing HTML into text.

*My method.*
 * I believe code should be beautiful, simple, and well rounded.  I've come to expect strings to be handled easily like arrays.  There's no reason why not.  So I've brought that reality to Ruby.

*Some tools to consider here.*
 * MightyString::HTML.text provides a more ideal HTML to ASCII formatting output.  This is an advanced block "filtering" module.  It works very well with, currently, extremely rare cases that fall through it's fingers.  Regardless it's beautiful, and will strive to be more so.
 
*Advanced detail.*
 * Look at the test/test_ms.rb for case usages of each feature.

> As a general rule I've avoided regex for this library.  But due to regex's nature of design I will use it for
parsing string data within **MightyString::HTML** .  I plan to keep parsing syntax as the only exception for using regex in this library.

Follow this project and contribute via github http://www.github.com/danielpclark/mightystring
<br />
<br />
# Goal for 0.3.0
 *Have Array and String interchangable.  Same errors, same results.*
