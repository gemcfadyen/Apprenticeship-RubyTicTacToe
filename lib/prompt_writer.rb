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
    board_to_display = format_board(board)
    std_out.puts board_to_display
  end

  def replay
    std_out.puts "Play again?"
  end

  private

  def divider
    " | " 
  end

  def format_board(board)
    board_to_display = ""  
    cell_number = 0 
    board.grid_for_display.each do |row|
      row.each do |cell| 
        board_to_display += format_row(cell, cell_number)
        cell_number+=1
      end
      board_to_display += new_line
    end
    board_to_display   
  end

  def format_row(cell_content, cell_number) 
    divider + display_cell(cell_content, cell_number)
  end

  def display_cell(cell, cell_number)
    cell.nil? ? one_based(cell_number).to_s : cell.to_s 
  end

   def one_based(index)
    index + 1
  end

  def new_line
    return " |\n"
  end
end
