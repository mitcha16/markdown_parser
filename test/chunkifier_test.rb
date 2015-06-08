require 'minitest/autorun'
require 'minitest/pride'

require './lib/chunkifier'

class TestChunkifier < Minitest::Test

  TEXT = <<-EOS
## Awesome Markdown Example

I am a banana.

Hello world.
  EOS

  def test_it_accepts_a_block_of_text
    chunkifier = Chunkifier.new(TEXT)
    assert_equal TEXT, chunkifier.text
  end

  def test_it_returns_an_array
    chunkifier = Chunkifier.new(TEXT)
    assert_instance_of Array, chunkifier.chunks
  end

  def test_it_should_return_the_correct_number_of_chunks
    chunkifier = Chunkifier.new(TEXT)
    assert_equal 3, chunkifier.chunks.count
  end

  def test_it_splits_into_chunks_at_correct_spots
    chunkifier = Chunkifier.new(TEXT)
    assert_equal "## Awesome Markdown Example", chunkifier.chunks[0]
  end

end