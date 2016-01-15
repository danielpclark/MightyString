require 'minitest_helper'

describe MightyString do
  it "String#at returns character at position" do
		_("abc".at(0)).must_equal "a"
    _("0123456789".at(-1)).must_equal "9"
    _("vwq".at(5)).must_be_nil
    _("vwq".at(-5)).must_be_nil
	end

  it "String#del deletes characters at positions" do
    _("asdfasdf".del(0..2)).must_equal "fasdf"
    _("asdfasdf".del(1)).must_equal "adfasdf"
    _("asdfasdf".del([1,3])).must_equal "adasdf"
    _("asdfasdf".del("a")).must_equal "sdfsdf"
    str = "asdfasdf"
    str.del! "sd"
    _(str).must_equal "afaf"
    str.del! (1..2)
    _(str).must_equal "af"
  end
 
  it "Can get the first and last character" do
    _("asdf".first).must_equal "a"
    _("asdf".last).must_equal "f"
  end

  it "String#pop pops it like it's hot" do
    _("asdf".pop).must_equal "f"
  end

  it "String#push pushes like Sisyphus" do
    _("asdf".push("r")).must_equal "asdfr"
  end

  it "String#shift" do
    _("asdf".shift).must_equal "a"
  end

  it "sorts" do
    str = "asdf"
    _(str.sort).must_equal "adfs"
    _(str).must_equal "asdf"
    str.sort!
    _(str).must_equal "adfs"
  end

  it "String#unshift" do
    _("asdf".unshift("r")).must_equal "rasdf"
  end

  it "String#values_at will show values at individual locations" do
    _("asdfasdfasdf".values_at(0,5,-1)).must_equal ["a", "s", "f"]
  end

	it "String#index_all returns all indexes of given string" do
    _("012324507654301243".index_all("0")).must_equal [0,7,13]
    _("the apple is the best fruit in the world".index_all("the")).must_equal [0, 13, 31]
    _("asdfasdfasdf".index_all(/sd/)).must_equal [1,5,9]
	end
	
	it "sifts out bad characters" do
    _("qa2ws3ed4rf5tg6yh7uj8ik9ol".sift(Range.new( "0", "9" ))).must_equal "23456789"
		
		custRange = (Range.new('a','z').to_a + Range.new('A','Z').to_a + [" "]).flatten
    _("<html><body> Content </body></html>".sift(custRange)).must_equal "htmlbody Content bodyhtml"
	end
	
	def test_strip_first_seq
    MightyString::HTML.strip_first_seq("APPLES n APPLES ARE Yummy!","APPLES",{"APPLES" => "COWS"}).must_equal "COWS n APPLES ARE Yummy!"
    MightyString::HTML.strip_first_seq("Cows Cows and more Cows!","Cows", {"Cows" => "Winner"}).must_equal "Winner Cows and more Cows!"
    MightyString::HTML.strip_first_seq("&nbsp; ---- &nbsp; APPLES &nbps;", "&nbsp;" ).must_equal "  ---- &nbsp; APPLES &nbps;"
    MightyString::HTML.strip_first_seq("&trade; ---- &trade; TradeMark &trade;", "&trade;" ).must_equal "(TM) ---- &trade; TradeMark &trade;"
	end
	
	def test_strip_html
    MightyString::HTML.text("<html>").must_equal ""
    MightyString::HTML.text("<table><tr><td>Piped sides.</td></tr></table>", :mappings => {"td" => ' | '}).must_equal " | Piped sides. | "
    MightyString::HTML.text("Hello<br>World!").must_equal "Hello\nWorld!"
    MightyString::HTML.text("<p>&quot;Quoted&quot; Copyright &copy; TradeMark &trade;</p>").must_equal "'Quoted' Copyright (c) TradeMark (TM)"
	end
end

