require './lib/format'
require './lib/file_stuff'
require './lib/chunkifier'


class ChiselRunner

  def run
    file_machine = FileManipulation.new
    formatter = Formatter.new
    input = ARGV[0]
    output = ARGV[1]
    text = file_machine.read(input)
    chunks = Chunkifier.new(text).chunks
    formatter.format(chunks, file_machine, output)
    print "Converted #{input} (#{text.count("\n")} lines) to #{output} (#{file_machine.read(output).count("\n")})\n\n"
    #look into why output count is not working
  end



end

if __FILE__ == $0
  ChiselRunner.new.run
end
