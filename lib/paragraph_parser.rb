

class ParagraphParser

  def convert(chunk)
    "<p>\n#{tab_each_line(chunk)}\n</p>"
  end

  def tab_each_line(chunk)
    lines = chunk.split ("\n")
    return lines.map do |chunks|
      "\t#{chunks}"
    end.join("\n")

  end

end
