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

  # board is immutable so test object is not the same
end
