class HumanPlayer 
  def initialize(command_line_interface)
    @command_line_interface = command_line_interface
  end

  def take_move(board)
    position = command_line_interface.get_move_from_player(board)
    board.make_move(position, PlayerSymbols::X)
  end


  private 
  attr_reader :command_line_interface

end
