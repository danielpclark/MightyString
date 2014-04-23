MightyString
by Daniel P. Clark

Description: Add Array functionality to Strings and other tools for Strings: Matching, Indexing, Substitution, Deletion, and more.

Pain points this solves.
 * After working with Python, it's obvious Ruby strings are lacking... so lets spiff them up.
 * Strings are Arrays... I mean really, think about it.  This works toward making Strings function as Arrays.
 * Also this provides additional string tools under MightyString... like strip_html.

My method.
 * I believe code should be beautiful, simple, and well rounded.  No animals were harmed in ... err I mean no regex was used in the making of this library.

Some tools to consider here.
 * MightyString::HTML.strip_html provides a more ideal HTML to ASCII formatting output.  This is an advanced block "filtering" module.  It works very well with, currently, extremely rare cases that fall through it's fingers.  Regardless it's beautiful, and will strive to be more so.
 
Advanced detail.
 * Look at the test/test_ms.rb for case usages of each feature.

Follow this project and contribute via github http://www.github.com/danielpclark/mightystring



Version 0.1.4
 Added string input acceptance to del
 Example: "12#34#56#78".del("#")
 => "12345678"
