class PromptWriter
  attr_reader :std_out 

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
      board_to_display = board_to_display + divider + display_cell(cells, index)
      board_to_display += add_new_line_if_end_of_row(index)
    end
    std_out.puts board_to_display
  end

  private

  def one_based(index)
    index + 1
  end

  def add_new_line_if_end_of_row(index)
    if (index + 1) % 3 == 0
      return " |\n"
    end
    return ""
  end

  def display_cell(cells, index)
   cells[index].nil? ? one_based(index).to_s : cells[index].to_s
  end

  def divider
    " | " 
  end
end
