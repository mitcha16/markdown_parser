require './lib/chunk_parser'
require './lib/emphasis'


class Formatter

  def format(chunks, file_machine, output)
    emphasiser = Emphasiser.new
    parser = ChunkParser.new
    chunks.each do |chunk|
      logic(chunk, file_machine, output, emphasiser, parser)
    end
  end

  def change_paragraphs_and_headers(chunk, file_machine, emphasiser, output, parser)
    formatted = parser.sort(chunk)
    finished = emphasiser.convert(formatted)
    file_machine.write(output, finished)
  end

  def change_lists(list, file_machine, emphasiser, output, parser)
    finished = emphasiser.convert(list)
    file_machine.write(output, finished)
  end

  def logic(chunk, file_machine, output, emphasiser, parser)
    list = parser.check_for_list(chunk)
    if list != true && list != nil
      change_lists(list, file_machine, emphasiser, output, parser)
    elsif list == true
      chunk = nil
    end
    if chunk != nil
      change_paragraphs_and_headers(chunk, file_machine, emphasiser, output, parser)
    end
  end

end
