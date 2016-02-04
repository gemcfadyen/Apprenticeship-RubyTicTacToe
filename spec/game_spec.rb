require 'board'
require 'game'
require 'player'
require 'player_symbols'
require 'player_options'

RSpec.describe Game do
  let(:player_x_spy) { instance_double(FakePlayer).as_null_object }
  let(:player_o_spy) { instance_double(FakePlayer).as_null_object }


  it "game is played with specific move" do
    allow(player_x_spy).to receive(:ready?).and_return(false)

    game = Game.new(Board.new, [player_x_spy, player_o_spy])
    updated_board = game.play_specific(3)

    expect(updated_board.symbol_at(3)).to be (PlayerSymbols::X)
  end


  it "continues until player is not ready" do
    allow(player_x_spy).to receive(:ready?).and_return(true, false)
    allow(player_o_spy).to receive(:ready?).and_return(true)

    expect(player_x_spy).to receive(:choose_move).exactly(1).times.and_return(2)
    expect(player_o_spy).to receive(:choose_move).exactly(1).times.and_return(8)

    Game.new(Board.new, [player_x_spy, player_o_spy]).play
  end

  it "players take turn until there is no space on board" do
    expect(player_x_spy).to receive(:choose_move).exactly(5).times.and_return(0, 1, 4, 5, 6)
    expect(player_o_spy).to receive(:choose_move).exactly(4).times.and_return(2, 3, 7, 8)

    Game.new(Board.new, [player_x_spy, player_o_spy]).play

  end

  it "game ends when a winning combination is formed" do
    allow(player_x_spy).to receive(:choose_move).once.and_return(2)
    allow(player_x_spy).to receive(:game_symbol).and_return(PlayerSymbols::X)

    board = Board.new([PlayerSymbols::X, PlayerSymbols::X, nil, PlayerSymbols::O, nil, nil, nil, nil, nil])
    updated_board = Game.new(board, [player_x_spy, player_o_spy]).play

    expect(updated_board.symbol_at(2)).to be (PlayerSymbols::X)
    expect(player_o_spy).to_not have_received(:choose_move)
  end

  it "game ends when there are no free spaces on the board" do
    full_board = Board.new([PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::O, PlayerSymbols::O, PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::X])
    game = Game.new(full_board, [player_x_spy, player_o_spy]).play

    expect(player_o_spy).to_not have_received(:choose_move)
    expect(player_x_spy).to_not have_received(:choose_move)
  end
end

class FakePlayer

  include Player

  def choose_move(board)
  end

  def ready?
  end
end

