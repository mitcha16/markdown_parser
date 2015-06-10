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
    @lists = []
    @ordered_list = []
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
    if array_of_numbers.include?(chunk[0])
      return chunk[0].to_i
    else
      return chunk[0]
    end
  end

  def array_of_numbers
    return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def check_for_list(chunk)
    first = get_first_element(chunk)
    if first == "*"
      @lists << chunk
      return true
    elsif first.class == Fixnum
      @ordered_list << chunk
      return true
    elsif @ordered_list.any? && first.class != Fixnum
      finished_list =  @ordered_list_parser.convert(@ordered_list)
      @ordered_list.clear
      return finished_list
    elsif @lists.any? && first != "*"
      finished_list =  @unordered_list_parser.convert(@lists)
      @lists.clear
      return finished_list
    end

  end
end
