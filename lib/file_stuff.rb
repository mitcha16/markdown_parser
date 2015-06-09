class FileManipulation

  def read(input)
    file = File.open(input, "r")
   message = ""
    while (line = file.gets)
      message += line
    end
    file.close

    return message

  end

  def write(input, file)
    file = File.open(file, "a")
    file << input
  end

end
