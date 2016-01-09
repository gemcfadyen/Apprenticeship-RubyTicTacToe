require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "has an empty board on initialisation" do
    expect(board.is_empty).to be true
  end

  it "has a board of nine cells" do
    expect(board.grid.size).to eq(9)
  end

  it "updates board with a symbol at a given position" do
    board.update(1, :X)
    expect(board.grid).to eq([nil, :X, nil, nil, nil, nil, nil, nil, nil])
  end

  it "returns a new copy of the board when an update is made" do
    original_board = board.grid 
    board.update(1, :X)
    updated_board = board.grid

    expect(updated_board.object_id).not_to eq(original_board.object_id)
  end
end
