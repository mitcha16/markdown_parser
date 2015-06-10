class UnorderedParser

  def convert(chunks)
    stripped = remove_asterick(chunks)
    list = format(stripped)
    return wrap!(list).join

  end

  def remove_asterick(chunks)
    return chunks.map do |chunk|
      chunk = chunk[1..-1]
    end
  end

  def format(chunks)
    return chunks.map do |chunk|
      chunk = "\t<li>#{chunk}</li>\n"
    end
  end

  def wrap!(list)
    list.unshift("<ul>\n")
    list.push("</ul>")
  end



end
