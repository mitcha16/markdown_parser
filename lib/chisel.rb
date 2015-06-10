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
end

def format(chunks, file_machine, output)
  emphasiser = Emphasiser.new
  parser = ChunkParser.new
  chunks.each do |chunk|
    formatted = parser.cycle(chunk)
    if formatted != nil
      finished = emphasiser.convert(formatted)
      file_machine.write(output, finished)
    end
  end


end


if __FILE__ == $0
  ChiselRunner.new.run
end



#fix your lists
#everything is working except for when they are at the end
#it is because the each loop is running out before they can finish
#possibly just make a check for list method inside parser
