require 'board'
require 'human_player'
require 'player_symbols'
require 'game'

RSpec.describe Game do
  let(:player_x_spy) { instance_double(HumanPlayer).as_null_object }
  let(:player_o_spy) { instance_double(HumanPlayer).as_null_object }

  it "players take turn until there is no space on board" do
    expect(player_x_spy).to receive(:choose_move).exactly(5).times.and_return(0, 1, 4, 5, 6)
    expect(player_o_spy).to receive(:choose_move).exactly(4).times.and_return(2, 3, 7, 8)

    game = Game.new(Board.new, [player_x_spy, player_o_spy])
    game.play
  end

  it "game ends when a winning combination is formed" do
    expect(player_x_spy).to receive(:choose_move).once.and_return(2)
    allow(player_x_spy).to receive(:game_symbol).and_return(PlayerSymbols::X)

    board = Board.new([PlayerSymbols::X, PlayerSymbols::X, nil, PlayerSymbols::O, nil, nil, nil, nil, nil])
    game = Game.new(board, [player_x_spy, player_o_spy])

    game.play
  end

  #  it "game is won when there is a winning combination in the board" do
  #    winning_board =  Board.new([X, X, X, nil, nil, O, O, nil])
  #  end
  #
end
