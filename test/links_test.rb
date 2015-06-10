require 'minitest/autorun'
require 'minitest/pride'
require './lib/links'

class LinksTest <Minitest::Test

  def test_it_checks_for_balanced_brackets_and_parenthesis
    linker = Linker.new
    assert_equal true, linker.has_both_signs?("this is a valid sentence (this is in here)[out] end")
  end


  def test_it_grabs_the_first_part_of_the_link
    linker = Linker.new
    assert_equal "an example", linker.get_first("[an example](http://example.com/ 'Title')")
  end

  def test_it_grabs_the_second_part_of_the_link
    linker = Linker.new
    assert_equal "http://example.com/", linker.get_second("[an example](http://example.com/ 'Title')")
  end

  def test_it_grabs_the_third_part_of_the_link
    linker = Linker.new
    assert_equal "\"Title\"", linker.get_third("[an example](http://example.com/ \"Title\")")
  end

  def test_it_formats_everything
    linker = Linker.new
    assert_equal "<a href=\"http://example.com/\" title=\"Title\">an example</a>",
    linker.format("[an example](http://example.com/ \"Title\")")
  end

  def test_it_will_exclude_title_if_none_is_given
    linker = Linker.new
    assert_equal "<a href=\"http://example.com/\">an example</a>",
    linker.format("[an example](http://example.com/)")
  end

  def test_it_will_exclude_title_if_none_is_given
    linker = Linker.new
    assert_equal "<a href=\"http://example.com/\">an example</a>",
    linker.format("[an example](http://example.com/)")
  end

  def test_it_will_decide_if_chunk_has_link
    linker = Linker.new
    assert_equal true,
    linker.has_both_signs?("This is an example of a sentence with a [an example](http://example.com/)")
  end

  def test_it_will_convert_a_chunk_with_a_link
    linker = Linker.new
    assert_equal "This is an example of a sentence with a <a href=\"http://example.com/\">an example</a>",
    linker.linkify("This is an example of a sentence with a [an example](http://example.com/)")
  end

end
