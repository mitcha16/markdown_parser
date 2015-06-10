require 'minitest/autorun'
require 'minitest/pride'
require './lib/unordered'

class UnorderedParserTest < Minitest::Test

  def test_it_removes_first_element_of_each_string_in_array
    parser = UnorderedParser.new
    assert_equal ["hello", "goodbye"], parser.remove_asterick(["*hello", "*goodbye"])
  end

  def test_it_formats_each_element_of_the_list_with_the_correct_tag
    parser = UnorderedParser.new
    assert_equal ["\t<li>hello</li>\n", "\t<li>goodbye</li>\n"], parser.format(["hello", "goodbye"])
  end

  def test_it_wraps_entire_list_with_ul
    parser = UnorderedParser.new
    assert_equal ["<ul>\n","hello", "goodbye", "</ul>"],
    parser.wrap!(["hello", "goodbye"])
  end

  def test_it_formats_everything_together_correctly
    parser = UnorderedParser.new
    assert_equal "<ul>\n\t<li>hello</li>\n\t<li>goodbye</li>\n</ul>",
    parser.convert(["*hello", "*goodbye"])
  end

end
