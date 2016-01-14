class HumanPlayer 
  def initialize(command_line_interface, symbol)
    @command_line_interface = command_line_interface
    @symbol = symbol
  end

  def take_move(board)
    position = command_line_interface.get_move_from_player(board)
    board.make_move(position, PlayerSymbols::X)
  end

  def game_symbol
    symbol
  end

  private 
  attr_reader :command_line_interface
  attr_reader :symbol
end
