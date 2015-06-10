class Linker

  def has_both_signs?(chunk)
    characters = chunk.chars
    if characters.include?("(") && characters.include?(")") && characters.include?("[") && characters.include?("]")
      return true
    else
      return false
    end
  end

  def linkify(chunk)
    if has_both_signs?(chunk)
      open = chunk.index("[") + 1
      close = chunk.index(")") - 1
      formatted = format(chunk)
      return formatted[0..open] + formatted[close..-1]
    else
      return chunk
    end
  end


  def format(link)
    if get_third(link) != nil
      return "#{link}<a href=\"#{get_second(link)}\" title=#{get_third(link)}>#{get_first(link)}</a>"
    else
      return "#{link}<a href=\"#{get_second(link)}\">#{get_first(link)}</a>"
    end

  end

  def get_second(link)
    open = link.index("(")
    close = link.rindex("/")
    return link[open + 1..close]

  end

  def get_first(link)
    open = link.index("[")
    close = link.index("]")
    return link[open + 1..close - 1]
  end

  def get_third(link)
    open = link.index("\"")
    close = link.rindex("\"")
    if open == nil || close == nil
      return nil
    else
      return link[open..close]
    end
  end

end
