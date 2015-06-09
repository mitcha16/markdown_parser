class HeaderParser

  def convert(chunk)
    count_of_hashes = count_and_remove(chunk)
    chunk = trim_hashes!(chunk, count_of_hashes)
    add_correct_tag!(chunk, count_of_hashes)
  end


  def count_and_remove(chunk)
    counter = 0
    while chunk[counter] == "#"
      counter += 1
    end
    return counter
  end

  def trim_hashes!(chunk, count)
    chunk = chunk[count..chunk.length]
  end

  def add_correct_tag!(chunk, count)
    chunk = "<h#{count}>#{chunk}</h#{count}>"
  end


end
