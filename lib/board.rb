class Board
  attr_reader :grid 

  def initialize
    @grid = Array.new(9) 
  end

  def is_empty
    !(grid.include?(:X) or grid.include?(:O))
  end
end
