require 'board'
require 'human_player'
require 'player_symbols'
require 'game'

RSpec.describe Game do
  before(:each) do
    @player_x_spy = instance_double("HumanPlayer")
    expect(@player_x_spy).to receive(:game_symbol).and_return(PlayerSymbols::X).exactly(5).times
    @player_o_spy = instance_double("HumanPlayer")
    expect(@player_o_spy).to receive(:game_symbol).and_return(PlayerSymbols::O).exactly(4).times
  end

  it "players take turn until there is no space on board" do
    expect(@player_x_spy).to receive(:choose_move).exactly(5).times.and_return(0, 1, 4, 5, 6)
    expect(@player_o_spy).to receive(:choose_move).exactly(4).times.and_return(2, 3, 7, 8)
    game = Game.new(Board.new, [@player_x_spy, @player_o_spy])
    game.play
  end

end
