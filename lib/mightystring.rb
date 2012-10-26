$: << File.join(File.dirname(__FILE__), "/mightystring")
require 'mightystring/string_matchpci'
require 'mightystring/string_index_all'
require 'mightystring/string_at'
require 'mightystring/string_del'
require 'mightystring/string_stripbyac'
require 'mightystring/strip_html'
require 'mightystring/version'

# Author: Daniel P. Clark / 6ft Dan(TM) Website: http://www.6ftdan.com

=begin LICENSE
MightyString is licensed under 'The MIT License (MIT)'

Copyright (c) 2012 Daniel P. Clark & 6ft Dan(TM)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
=end

class String
    include At::String
    include Del::String
    include Index_All::String
    include Match_PCI::String
    include StripbyAC::String
end
