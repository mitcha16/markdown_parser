require './lib/paragraph_parser'
require './lib/header_parser'
require './lib/unordered'

class ChunkParser


  def initialize
    @header_parser = HeaderParser.new
    @paragraph_parser = ParagraphParser.new
    @unordered_list_parser = UnorderedParser.new
    @lists = []
  end


  def cycle(chunk)
    first = get_first_element(chunk)
    if first == "*"
      @lists << chunk
      return
    elsif @lists.any? && first != "*"
      finished_list =  @unordered_list_parser.convert(@lists)
      @lists.clear
      return finished_list
    else
      sort(chunk)
    end

  end

  def sort(chunk)
    first = get_first_element(chunk)
    if first == "#"
      return @header_parser.convert(chunk)
    else
      return @paragraph_parser.convert(chunk)
    end
  end

  def get_first_element(chunk)
    return chunk[0]
  end
end
