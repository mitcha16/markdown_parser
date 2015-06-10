require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/paragraph_parser'

class ParagraphParserTest < Minitest::Test
    def test_it_will_format_just_one_word
      parser = ParagraphParser.new
      assert_equal "<p>\nHello\n</p>", parser.convert("Hello")
    end

    def test_it_will_format_a_sentence
      parser = ParagraphParser.new
      assert_equal "<p>\nHello, this is a longer test\n</p>",
      parser.convert("Hello, this is a longer test")
    end

    def test_it_will_format_a_paragraph
      parser = ParagraphParser.new
      assert_equal "<p>\nHello, this is a longer test\n"+
      "now we have multiple lines too!\n</p>",
      parser.convert("Hello, this is a longer test\nnow we have multiple lines too!")
    end
end
