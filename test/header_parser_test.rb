require 'simplecov'
SimpleCov.start
require '../lib/header_parser'
require 'minitest/autorun'
require 'minitest/pride'

class HeaderParserTest < Minitest::Test
  TEXT = <<-EOS
  ##This is a header
  EOS

  def it_accepts_chunk_of_text
    head_parser = HeaderParser.new
    assert_respond_to head_parser, convert(TEXT)
  end

  def it_counts_the_number_of_pound_signs_at_the_beginning
    head_parser = HeaderParser.new
    assert_equal 2 head_parser.count_and_remove(TEXT)
  end



end
