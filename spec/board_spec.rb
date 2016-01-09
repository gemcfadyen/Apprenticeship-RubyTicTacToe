require 'board'

RSpec.describe Board do
  let (:board) {Board.new}

  it "a new board is empty" do
    expect(board.is_empty).to be true
  end

  it "a new board has nine cells" do
    expect(board.grid.size).to eq(9)
  end

end
