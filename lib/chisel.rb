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

    end

  end


end

ChiselRunner.new.run
