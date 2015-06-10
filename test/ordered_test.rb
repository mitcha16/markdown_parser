require 'minitest/autorun'
require 'minitest/pride'
require './lib/ordered'

class OrderedParserTest < Minitest::Test


  def test_it_formats_each_element_of_the_list_with_the_correct_tag

    parser = OrderedParser.new
    assert_equal ["\t<li>hello</li>\n", "\t<li>goodbye</li>\n"], parser.format(["hello", "goodbye"])
  end

  def test_it_wraps_entire_list_with_ul

    parser = OrderedParser.new
    assert_equal ["<ol>\n","hello", "goodbye", "</ol>"],
    parser.wrap!(["hello", "goodbye"])
  end

  def test_it_will_remove_numbers_and_period
    parser = OrderedParser.new
    assert_equal [" hello", " goodbye"], parser.remove_numbers(["12938. hello", "26. goodbye"])
  end

  def test_it_formats_everything_together_correctly

    parser = OrderedParser.new
    assert_equal "<ol>\n\t<li> hello</li>\n\t<li> goodbye</li>\n</ol>",
    parser.convert(["1. hello", "23. goodbye"])
  end

end
