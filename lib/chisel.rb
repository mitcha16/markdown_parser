require './lib/chunk_parser'
require './lib/file_stuff'
require './lib/chunkifier'
require './lib/chunk_parser'

class ChiselRunner

  def run
    file_machine = FileManipulation.new
    input = ARGV[0]
    output = ARGV[1]
    text = file_machine.read(input)
    chunks = Chunkifier.new(text).chunks
    chunks.each do |chunk|
      parser = ChunkParser.new(chunk)
      formatted_text = parser.sort
      file_machine.write(output, formatted_text)
    end

  end


end

ChiselRunner.new.run
