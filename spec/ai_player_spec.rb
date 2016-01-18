require 'ai_player'
require 'player_symbols'
require 'board'

RSpec.describe AiPlayer do
  let(:ai_player) { AiPlayer.new(PlayerSymbols::X) }

  it "has a player symbol" do
    expect(ai_player.game_symbol).to eq(PlayerSymbols::X)
  end

  it "scores zero when a draw is made" do
    draw_board = Board.new([PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::O, PlayerSymbols::O, PlayerSymbols::X, PlayerSymbols::X])
    expect(ai_player.minimax(draw_board)).to be (0)
  end

  it "scores one if computer wins" do
   winning_board = Board.new([PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::X, nil, nil, PlayerSymbols::O, PlayerSymbols::O, nil, nil])
    
    expect(ai_player.minimax(winning_board)).to be(1)
  end
end


