$: << '.'
Dir['mightystring/*.rb'].map { |x| x.split( "." )[ 0 ] }.each { |f| require f }

# Author: Daniel P. Clark / 6ft Dan(TM) Website: http://www.6ftdan.com

=begin LICENSE
MightyString is licensed under 'The MIT License (MIT)'

Copyright (c) 2012-2014 Daniel P. Clark & 6ft Dan(TM)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
=end

class String
    include At::String
    include Del::String
    include Fetch::String
    include First::String
    include Index_All::String
    include Join::String
    include Last::String
    include Match_PCI::String
    include Pop::String
    include Push::String
    include Shift::String
    include Sort::String
    include Strip_byAC::String
    include UnShift::String
end
