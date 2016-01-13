class PromptWriter
  attr_reader :std_out 

  def initialize(std_out)
    @std_out = std_out
  end

  def ask_for_next_move
    std_out.puts "Please enter your next move"
  end

  def show_winning_message(symbol)
    std_out.puts "The game has been won by #{symbol}!"
  end

  def show_draw_message 
    std_out.puts "The game is a draw!"
  end

  def show_board(board)
    board_to_display = ""
    cells = board.grid_for_display.split("$")

    cells.each_index do |index|
      board_to_display = board_to_display + divider + display_cell(cells, index)
      board_to_display += add_new_line_if_end_of_row(index)
    end
    std_out.puts board_to_display
  end

  def replay
    std_out.puts "Play again?"
  end

  private

  def divider
    " | " 
  end

  def display_cell(cells, index)
    cells[index] == "empty" ? one_based(index).to_s : cells[index].to_s
  end

  def one_based(index)
    index + 1
  end

  def add_new_line_if_end_of_row(index)
    if one_based(index) % 3 == 0
      return " |\n"
    end
    return ""
  end

end
