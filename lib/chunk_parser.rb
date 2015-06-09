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
      @header_parser.convert(chunk)
      return "header"
    else
      @paragraph_parser.convert(chunk)
      return "paragraph"
    end
  end

  def get_first_element
    return chunk[0]
  end
end
