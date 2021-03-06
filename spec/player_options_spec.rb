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

  it "has valid player option ids" do
    expect(PlayerOptions::valid_ids).to eq ([1, 2, 3])
  end

  it "gets player type for id" do
    expect(PlayerOptions::player_type_for_id(1)).to eq (PlayerOptions::HUMAN_VS_HUMAN)
  end

  it "gets player options for display" do
 expect(PlayerOptions::display_player_options).to eq("(1) Human vs Human, (2) Human vs Ai, (3) Ai vs Human" )
  end

  it "gets all player options" do
    all_expected_types = { 1 => "Human vs Human", 2=> "Human vs Ai", 3 => "Ai vs Human" }
    expect(PlayerOptions::all).to eq(all_expected_types)
  end
end
