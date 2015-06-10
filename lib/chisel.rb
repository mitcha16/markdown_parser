require './lib/chunk_parser'
require './lib/file_stuff'
require './lib/chunkifier'
require './lib/chunk_parser'
require './lib/emphasis'


class ChiselRunner

  def run
    file_machine = FileManipulation.new
    input = ARGV[0]
    output = ARGV[1]
    text = file_machine.read(input)
    chunks = Chunkifier.new(text).chunks
    format(chunks, file_machine, output)
    print "Converted #{input} (#{text.count("\n")} lines) to #{output} (#{file_machine.read(output).count("\n")})\n\n"
    #look into why output count is not working
  end


  def format(chunks, file_machine, output)
    emphasiser = Emphasiser.new
    parser = ChunkParser.new
    chunks.each do |chunk|
      list = parser.check_for_list(chunk)
      if list != true && list != nil
        finished = emphasiser.convert(list)
        file_machine.write(output, finished)
      elsif list == true
        chunk = nil
      end
      if chunk != nil
      formatted = parser.sort(chunk)
      finished = emphasiser.convert(formatted)
      file_machine.write(output, finished)
    end
    end
  end


end


if __FILE__ == $0
  ChiselRunner.new.run
end



#fix your lists
#everything is working except they are not replacing current
