require 'player_symbols'

RSpec.describe PlayerSymbols do

  it "has player symbol X" do
    expect(PlayerSymbols::X).to be :X
  end

  it "has player symbol O" do
    expect(PlayerSymbols::O).to be :O
  end

  it "finds opponent of X" do
    expect(PlayerSymbols::opponent(PlayerSymbols::X)).to be :O
  end
  
  it "finds opponent of O" do
    expect(PlayerSymbols::opponent(PlayerSymbols::O)).to be :X
  end

end
