require "../src/mightystring"
require "minitest/autorun"
describe MightystringTest do
  it "String#del deletes characters at positions" do
    expect("asdfasdf".del(0..2)).must_equal "fasdf"
    expect("asdfasdf".del(1)).must_equal "adfasdf"
    expect("asdfasdf".del([1,3])).must_equal "adasdf"
    expect("asdfasdf".del("a")).must_equal "sdfsdf"
  end

  it "Can get the first and last character" do
    expect("asdf".first).must_equal "a"
    expect("asdf".last).must_equal "f"
  end

  it "String#head" do
    expect("asdf".head).must_equal "a"
    expect("asdf".head(3)).must_equal "asd"
  end

  it "String#tail" do
    expect("asdf".tail).must_equal "sdf"
    expect("asdf".tail(3)).must_equal "f"
  end

  it "String#bisect_head and String#head_" do
    expect("asdf".bisect_head).must_equal ["a", "sdf"]
    expect("asdf".bisect_head(3)).must_equal ["asd", "f"]
    expect("asdf".bhead).must_equal ["a", "sdf"]
    expect("asdf".bhead(3)).must_equal ["asd", "f"]
  end

  it "String#bisect_tail and String#tail_" do
    expect("asdf".bisect_tail).must_equal ["sdf", "a"]
    expect("asdf".bisect_tail(3)).must_equal ["f", "asd"]
    expect("asdf".btail).must_equal ["sdf", "a"]
    expect("asdf".btail(3)).must_equal ["f", "asd"]
  end

  it "sorts" do
    str = "asdf"
    expect(str.sort).must_equal "adfs"
    expect(str).must_equal "asdf"
   end

  it "String#values_at will show values at individual locations" do
    expect("asdfasdfasdf".values_at(0,5,-1)).must_equal ["a", "s", "f"]
  end

  it "String#index_all returns all indexes of given string" do
    expect("012324507654301243".index_all("0")).must_equal [0,7,13]
    expect("the apple is the best fruit in the world".index_all("the")).must_equal [0, 13, 31]
    expect("asdfasdfasdf".index_all(/sd/)).must_equal [1,5,9]
    expect("asdfasdfasdf".index_all("a")).must_equal [0,4,8]
    expect("asdfasdfasdf".index_all("f")).must_equal [3,7,11]
  end

  it "sifts out bad characters" do
    expect("qa2ws3ed4rf5tg6yh7uj8ik9ol".sift(Range.new( "0", "9" ))).must_equal "23456789"

    custRange = (Range.new("a","z").to_a + Range.new("A","Z").to_a + [" "]).flatten
    expect("<html><body> Content </body></html>".sift(custRange)).must_equal "htmlbody Content bodyhtml"
  end
end

