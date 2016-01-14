require 'human_player'
require 'board'
require 'player_symbols'

RSpec.describe HumanPlayer do
  before (:each) do
    @command_line_interface_spy = instance_double("CommandLineUI")
    @symbol = PlayerSymbols::X
    @human =  HumanPlayer.new(@command_line_interface, @symbol)
  end

  it "chooses a move on the board" do
    expect(@command_line_interface).to receive(:get_move_from_player) { 1 }

    updated_board = @human.take_move(Board.new)

    expect(updated_board.get_symbol_at(1)).to be PlayerSymbols::X
  end

  it "has a player symbol" do 
    expect(@human.game_symbol).to be PlayerSymbols::X

  end

end
