require './lib/paragraph_parser'
require './lib/header_parser'

class ChunkParser
  attr_reader :chunk

  def initialize(chunk)
    @chunk = chunk
    @header_parser = HeaderParser.new
    @paragraph_parser = ParagraphParser.new
  end

  def sort
    first = get_first_element
    if first == "#"
      return @header_parser.convert(chunk)

    else
      return @paragraph_parser.convert(chunk)

    end
  end

  def get_first_element
    return chunk[0]
  end
end
