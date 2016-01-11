class PromptWriter
  attr_accessor :std_out 

  def initialize(std_out)
    @std_out = std_out
  end

  def ask_for_next_move
    std_out.puts "Please enter your next move"
  end

  def show_winning_message
    std_out.puts "The game has been won!"
  end

  def show_draw_message 
    std_out.puts "The game is a draw!"
  end

  def show_board(board)
    board_to_display = ""
    cells = board.grid

    cells.each_index do |index|
      board_to_display = board_to_display + display_cell(cells[index], index) 

      #  if !cells[index].nil?
      #    board_to_display = board_to_display + divider + cells[index].to_s   
      #  else 
      #    board_to_display = board_to_display + divider + one_based(index).to_s
      board_to_display += add_new_line_if_end_of_row(index)
    end
    std_out.puts board_to_display
  end

  private

  def one_based(index)
    index + 1
  end

  def divider
    " | " 
  end

  def add_new_line_if_end_of_row(index)
    if (index + 1) % 3 == 0
      return " |\n"
    end
    return ""
  end

  def display_cell(content, index)
    if !content.nil?
      return divider + content.to_s   
    else 
      return divider + one_based(index).to_s
    end
  end
end
