require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "is empty on initialisation" do
    expect(board.is_empty).to be true
  end

  it "is not empty when all slots are occupied" do
    full_board = Board.new([:X, :O, :X, :O, :X, :O, :X, :X, :O]) 
    expect(full_board.is_empty).to be false
  end

  it "has nine cells" do
    expect(board.grid.size).to eq(9)
  end

  it "displays the current grid formation" do
    board = Board.new([nil, nil, nil, nil, :X, :O, nil, nil, nil])
    expect(board.grid_for_display).to eq("empty$empty$empty$empty$X$O$empty$empty$empty$")
  end

  it "can be upadated updated at a given position" do
    board.update(1, :X)
    expect(board.grid).to eq([nil, :X, nil, nil, nil, nil, nil, nil, nil])
  end

  it "returns a new copy of the board when an update is made" do
    original_board = board.grid 
    board.update(1, :X)
    updated_board = board.grid

    expect(updated_board.object_id).not_to eq(original_board.object_id)
  end

  it "has free spaces" do
    expect(board.has_free_spaces).to be true
  end

  it "has no free spaces when all slots are occupied" do
    full_board = Board.new([:X, :O, :X, :O, :X, :O, :X, :X, :O]) 
    expect(full_board.has_free_spaces).to be false
  end

  it "has no winning combination" do
    winning_board = Board.new([:O, :X, :X, nil, nil, nil, nil, nil, nil])
    expect(winning_board.has_winning_combination).to be false
  end

  it "has winning combination of X in top row" do
    winning_board = Board.new([:X, :X, :X, nil, nil, nil, nil, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of X in middle row" do
    winning_board = Board.new([nil, nil, nil, :X, :X, :X, nil, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of X in bottom row" do
    winning_board = Board.new([nil, nil, nil, nil, nil, nil, :X, :X, :X])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of X in left column" do
    winning_board = Board.new([:X, nil, nil, :X, nil, nil, :X, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of X in middle column" do
    winning_board = Board.new([nil, :X, nil, nil, :X, nil, nil, :X, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of X in right column" do
    winning_board = Board.new([nil, nil, :X, nil, nil, :X, nil, nil, :X])
    expect(winning_board.has_winning_combination).to be true
  end
  
  it "has winning combination of X in first diagonal" do
    winning_board = Board.new([:X, nil, nil, nil, :X, nil, nil, nil, :X])
    expect(winning_board.has_winning_combination).to be true
  end
  
  it "has winning combination of X in second diagonal" do
    winning_board = Board.new([nil, nil, :X, nil, :X, nil, :X, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of O in top row" do
    winning_board = Board.new([:O, :O, :O, nil, nil, nil, nil, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of O in left column" do
    winning_board = Board.new([:O, nil, nil, :O, nil, nil, :O, nil, nil])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning combination of O in first diagonal" do
    winning_board = Board.new([:O, nil, nil, nil, :O, nil, nil, nil, :O])
    expect(winning_board.has_winning_combination).to be true
  end

  it "has winning symbol X" do
    winning_board = Board.new([:X, :X, :X, nil, nil, nil, nil, nil, nil])
    expect(winning_board.winning_symbol).to be :X
  end

  it "has winning symbol O" do
    winning_board = Board.new([:O, :O, :O, nil, nil, nil, nil, nil, nil])
    expect(winning_board.winning_symbol).to be :O
  end

  it "has no winning symbol" do
    expect(board.winning_symbol).to be :unset
  end
end
