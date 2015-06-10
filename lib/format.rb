require './lib/chunk_parser'
require './lib/emphasis'
require './lib/links'


class Formatter

  def format(chunks, file_machine, output)
    emphasiser = Emphasiser.new
    parser = ChunkParser.new
    linker = Linker.new
    chunks.each do |chunk|
      logic(chunk, file_machine, output, emphasiser, parser, linker)
    end
  end

  def change_paragraphs_and_headers(chunk, file_machine, emphasiser, output, parser, linker)
    formatted = parser.sort(chunk)
    emphasized = emphasiser.convert(formatted)
    finished = linker.linkify(emphasized)
    file_machine.write(output, finished)
  end

  def change_lists(list, file_machine, emphasiser, output, parser, linker)
    emphasized = emphasiser.convert(list)
    finished = linker.linkify(emphasized)
    file_machine.write(output, finished)
  end

  def logic(chunk, file_machine, output, emphasiser, parser, linker)
    list = parser.check_for_list(chunk)
    if list != true && list != nil
      change_lists(list, file_machine, emphasiser, output, parser, linker)
    elsif list == true
      chunk = nil
    end
    if chunk != nil
      change_paragraphs_and_headers(chunk, file_machine, emphasiser, output, parser, linker)
    end
  end

end
