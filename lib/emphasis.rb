class Emphasiser

  def count_astericks(text)
    text.count("*")
  end

  def convert(text)
    if text != nil
      replaced = replace_double_astericks!(text)
      return replace_single_astericks!(replaced)
    end
  end

  def replace_single_astericks!(text)
    counter = 0
    replaced = text.chars.map do |character|
      if character == "*"
        counter +=   1
      end
      if character == "*" && counter.odd?
        character = "<em>"
      elsif character == "*" && counter.even?
        character = "</em>"
      else
        character = character
      end
    end
    return replaced.join
  end


  def replace_double_astericks!(text)
    array_of_text = text.split("**")
    array_of_text.size.times do |index|
      if index.odd?
        array_of_text[index] = "<strong>#{array_of_text[index]}</strong>"
      end
    end
    return array_of_text.join

  end

end
