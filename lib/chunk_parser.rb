require './lib/paragraph_parser'
require './lib/header_parser'
require './lib/unordered'
require './lib/ordered'

class ChunkParser


  def initialize
    @header_parser = HeaderParser.new
    @paragraph_parser = ParagraphParser.new
    @unordered_list_parser = UnorderedParser.new
    @ordered_list_parser = OrderedParser.new
  end

  def sort(chunk)
    first = get_first_element(chunk)
    logic(chunk, first)
  end

  def get_first_element(chunk)
    if array_of_numbers.include?(chunk[0])
      return chunk[0].to_i
    else
      return chunk[0]
    end
  end

  def array_of_numbers
    return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def logic(chunk, first)
    if first == "#"
      return @header_parser.convert(chunk)
    elsif first == "*"
      return @unordered_list_parser.convert(chunk)
    elsif first.class == Fixnum
      return @ordered_list_parser.convert(chunk)
    else
      return @paragraph_parser.convert(chunk)
    end
  end
end
