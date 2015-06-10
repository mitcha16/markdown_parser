require 'simplecov'
SimpleCov.start

require './lib/chunk_parser'
require './lib/file_stuff'
require './lib/chunkifier'
require './lib/chunk_parser'
require './lib.emphasiser'

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
    chunks.each do |chunk|
      parser = ChunkParser.new(chunk)
      converted_chunks = parser.sort
      formatted_text = emphasiser.convert(converted_chunks)
      file_machine.write(output, formatted_text)
    end
  end
end

if __FILE__ == $0
  ChiselRunner.new.run
end
