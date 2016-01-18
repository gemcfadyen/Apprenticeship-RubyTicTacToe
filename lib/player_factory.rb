class PlayerFactory

  def create_human_vs_human_players(command_line_ui)
     [
       HumanPlayer.new(command_line_ui, PlayerSymbols::X),
       HumanPlayer.new(command_line_ui, PlayerSymbols::O)
     ]
  end
end
