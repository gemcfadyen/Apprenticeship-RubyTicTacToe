require 'player_options'

RSpec.describe PlayerOptions do

  it "has player option Human vs Human" do
    expect(PlayerOptions::HUMAN_VS_HUMAN).to eq ("Human vs Human")
  end

  it "has player option Human vs Ai" do
    expect(PlayerOptions::HUMAN_VS_AI).to eq ("Human vs Ai")
  end

  it "has player option Ai vs Human" do
    expect(PlayerOptions::AI_VS_HUMAN).to eq ("Ai vs Human")
  end
end
