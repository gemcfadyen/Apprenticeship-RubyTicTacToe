class Board
  attr_reader :grid 

  def initialize
    @grid = Array.new 
  end

  def is_empty
    grid.empty?
  end
end
