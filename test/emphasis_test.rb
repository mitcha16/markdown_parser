require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/emphasis'

class EmphasisTest < Minitest::Test

  def test_it_can_locate_an_asterick
    emphasiser = Emphasiser.new
    assert_equal 1, emphasiser.count_astericks("Hello*")
  end

  def test_it_replaces_astericks_with_tags
    emphasiser = Emphasiser.new
    assert_equal "<em>Hello</em>", emphasiser.convert("*Hello*")
  end

  def test_it_replaces_double_astericks_with_strong_tags

    emphasiser = Emphasiser.new
    assert_equal "<strong>stronged</strong>",
    emphasiser.convert("**stronged**")
  end

  def test_it_handles_multiple_emphasis
    emphasiser = Emphasiser.new
    assert_equal "<em>Hello</em> I am <em>Mitch</em>", emphasiser.convert("*Hello* I am *Mitch*")
  end

  def test_it_can_handle_nested_astericks

    emphasiser = Emphasiser.new
    assert_equal "My <em>emphasized and <strong>stronged</strong> text</em> is awesome.",
    emphasiser.convert("My *emphasized and **stronged** text* is awesome.")

  end
end
