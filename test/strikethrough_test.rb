require 'minitest/autorun'
require './lib/strikethrough'
require 'minitest/pride'

class StrikethroughTest < Minitest::Test

  def test_it_exists
    assert Strikethrough.new
  end

  def test_it_can_format_one_word_correctly
    assert_equal "<del>hello</del>", Strikethrough.new.format("hello")
  end

  def test_it_can_format_an_entire_sentence_correctly
    assert_equal "<del>This whole sentence will have a line through it!</del>",
    Strikethrough.new.format("This whole sentence will have a line through it!")
  end


end
