class Chunkifier
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def chunks
    split_array = text.split("\n\n")
  end
end
