class PromptWriter
  attr_accessor :std_out 

  def initialize(std_out)
    @std_out = std_out
  end

  def ask_for_next_move
    std_out.puts "Please enter your next move"
  end

end
