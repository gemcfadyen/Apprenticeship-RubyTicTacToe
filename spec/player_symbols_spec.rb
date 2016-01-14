require 'player_symbols'

RSpec.describe PlayerSymbols do

  it "has player symbol X" do
    expect(PlayerSymbols::X).to be :X
  end

  it "has player symbol O" do
    expect(PlayerSymbols::O).to be :O
  end
end
