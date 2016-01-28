require 'player_factory'

RSpec.describe PlayerFactory do
  it "create human is not implemented" do
    expect { PlayerFactory.new.create_players(PlayerOptions::HUMAN_VS_HUMAN, command_line) }.to raise_error(NotImplementedError, /This PlayerFactory cannot respond to:/)
  end

  def command_line
    nil
  end
end
