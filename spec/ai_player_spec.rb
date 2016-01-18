require 'ai_player'
require 'player_symbols'

RSpec.describe AiPlayer do
  let(:ai_player) { AiPlayer.new(PlayerSymbols::X) }

  it "has a player symbol" do
    expect(ai_player.game_symbol).to eq(PlayerSymbols::X)
  end

  it "scores zero when a draw is made" do
    expect(ai_player.minimax).to be (0)
  end
end


