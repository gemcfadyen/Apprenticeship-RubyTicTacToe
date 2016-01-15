class HumanPlayer 
  def initialize(command_line_interface, symbol)
    @command_line_interface = command_line_interface
    @symbol = symbol
  end

  def choose_move(board)
    position = command_line_interface.get_move_from_player(board)
  end

  def game_symbol
    symbol
  end

  private 

  attr_reader :command_line_interface, :symbol
end
