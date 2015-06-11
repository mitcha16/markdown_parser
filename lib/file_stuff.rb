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

  def write(file, input)
    file = File.open(file, "a")
    file << "#{input}\n"
    file.close
  end

end
