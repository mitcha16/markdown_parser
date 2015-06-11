class Emphasiser

  def count_astericks(text)
    text.count("*")
  end

  def convert(text)
      while text.include?("*")
        replace_double_astericks!(text)
        replace_single_astericks!(text)
      end
      return text
  end

  def replace_single_astericks!(text)
    text.sub!("*", "<em>")
    text.sub!("*", "</em>")
  end


  def replace_double_astericks!(text)
    text.sub!("**", "<strong>")
    text.sub!("**", "</strong>")
  end

end
