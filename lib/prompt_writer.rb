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

  def show_board(board)
    board_to_display = ""
    cells = board.grid
    cells.each_index do |index|
      if cells[index].nil?
        puts " the current index is: " + index.to_s
      end
      cell_value = index + 1
      board_to_display = board_to_display + " | " + cell_value.to_s

      if (index + 1) % 3 == 0
        board_to_display = board_to_display + " |\n"
      end

    end
    puts "board is: " + board_to_display.to_s
    @std_out.puts board_to_display
  end
end
