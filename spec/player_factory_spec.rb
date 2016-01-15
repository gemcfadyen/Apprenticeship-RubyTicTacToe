require 'player_factory'
require 'human_player'
require 'command_line_ui'
require 'player_symbols'

RSpec.describe PlayerFactory do
  let(:player_factory) { PlayerFactory.new }
  let(:command_line_ui_spy) { instance_double(CommandLineUI) }

  it "creates two human players" do
    players = player_factory.create_human_vs_human_players(command_line_ui_spy)

    expect(players[0].class).to be HumanPlayer
    expect(players[1].class).to be HumanPlayer
  end
end
