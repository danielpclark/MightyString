require 'test/unit'
$: << 'lib/'
require 'mightystring'

class TestMightyString < Test::Unit::TestCase
	def test_at
		assert "abc".at(0) == "a"
		assert "0123456789".at(-1) == "9"
	end
	
	def test_del
		assert "abc".del(1) == "ac"
		assert "0123456789".del(0..2) == "3456789"
		assert "iudsfbv\nui4adv\nvw7revg".del("\n") == "iudsfbvui4advvw7revg"
	end

	# def test_each
	# 	 assert "12345".each.all?{|i| i.to_i < 10}
	# end

	def test_index_all
		assert "012324507654301243".index_all 0 == [0,7,13]
		assert "the apple is the best fruit in the world".index_all "the" == [0, 13, 31]
	end
	
	def test_match_pci
		assert "<TD>".match_pci("td")
		assert "<TD>".match_pci("><") == false
		assert "Principle".match_pci("rINCi")
	end
	
	def test_strip_byac
		assert "qa2ws3ed4rf5tg6yh7uj8ik9ol".strip_byac( Range.new( "0", "9" ).to_a ) == "23456789"
		
		custRange = (Range.new('a','z').to_a + Range.new('A','Z').to_a + [" "]).flatten
		assert "<html><body> Content </body></html>".strip_byac(custRange) == "htmlbody Content bodyhtml"
	end
	
	def test_strip_first_seq
		assert MightyString::HTML.strip_first_seq("APPLES n APPLES ARE Yummy!","APPLES",{"APPLES" => "COWS"}) == "COWS n APPLES ARE Yummy!"
		assert MightyString::HTML.strip_first_seq("Cows Cows and more Cows!","Cows", {"Cows" => "Winner"}) == "Winner Cows and more Cows!"
		assert MightyString::HTML.strip_first_seq("&nbsp; ---- &nbsp; APPLES &nbps;", "&nbsp;" ) == "  ---- &nbsp; APPLES &nbps;"
		assert MightyString::HTML.strip_first_seq("&trade; ---- &trade; TradeMark &trade;", "&trade;" ) == "(TM) ---- &trade; TradeMark &trade;"
	end
	
	def test_strip_html
		assert MightyString::HTML.text("<html>") == ""
		assert MightyString::HTML.text("<table><tr><td>Piped sides.</td></tr></table>", :mappings => {"td" => ' | '}) == " | Piped sides. | "
		assert MightyString::HTML.text("Hello<br>World!") == "Hello\nWorld!"
		assert MightyString::HTML.text("<p>&quot;Quoted&quot; Copyright &copy; TradeMark &trade;</p>") == "'Quoted' Copyright (c) TradeMark (TM)"
	end
end

