require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/header_parser'


class HeaderParserTest < Minitest::Test
  TEXT = <<-EOS
##This is a header
 EOS


  def test_counts_the_number_of_pound_signs_at_the_beginning
    head_parser = HeaderParser.new
    assert_equal 2, head_parser.count_and_remove(TEXT)
  end

  def test_it_can_remove_the_pound_signs_at_the_beginning
    count = 2
    head_parser = HeaderParser.new
    assert_equal "This is a header\n", head_parser.trim_hashes!(TEXT, count)
  end

  def test_it_will_leave_pound_signs_alone_if_they_are_not_in_the_front
    count = 3
    head_parser = HeaderParser.new
    assert_equal "This is a #newHeader", head_parser.trim_hashes!("###This is a #newHeader", count)
  end

  def test_it_returns_the_correctly_formatted_text
    head_parser = HeaderParser.new
    assert_equal "<h2>This is a header\n</h2>", head_parser.convert(TEXT,)
  end


end
