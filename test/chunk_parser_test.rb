require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/chunk_parser'
require './lib/paragraph_parser'
require './lib/header_parser'


class TestChunkParser < Minitest::Test
  TEXT = <<-EOS
## Awesome Markdown Example
  EOS
  PARA = <<-EOS
This is a paragraph.
  EOS
  def test_it_recieves_a_string_of_a_chunk
    parser = ChunkParser.new(TEXT)
    assert_respond_to parser, :chunk
  end

  def test_it_can_look_at_the_first_element_of_chunk
    parser = ChunkParser.new(TEXT)
    assert_equal "#", parser.get_first_element
  end

  def test_it_sorts_headers_into_the_correct_section
    parser = ChunkParser.new(TEXT)
    header_parser = HeaderParser.new
    assert_equal header_parser.convert(TEXT), parser.sort
  end

  def test_it_sorts_paragraphs_into_the_correct_second
    parser = ChunkParser.new(PARA)
    paragraph_parser = ParagraphParser.new
    assert_equal paragraph_parser.convert(PARA), parser.sort
  end
end
