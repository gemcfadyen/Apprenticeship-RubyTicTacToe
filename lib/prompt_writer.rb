class PromptWriter
  attr_accessor :std_out 

  def initialize(std_out)
    @std_out = std_out
  end

  def ask_for_next_move
   @std_out.puts "Please enter your next move"
  end

  def show_winning_message
    @std_out.puts "The game has been won!"
  end

  def show_draw_message 
    @std_out.puts "The game is a draw!"
  end
end
