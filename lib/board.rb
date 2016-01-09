class Board
  attr_accessor :grid 

  def initialize
    @grid = Array.new(9) 
  end

  def is_empty
    !(grid.include?(:X) or grid.include?(:O))
  end

  def update(index, symbol)
    grid_before_index = copy_portion_of_grid(index)
    grid_after_index = copy_portion_of_grid(grid.size - (index + 1))  

    @grid = Array.new(grid_before_index + [symbol] + grid_after_index)
  end

#  def grid
#    @grid
#  end
#
#  def grid=(grid)
#    @grid = grid
#  end
#
  private
  def copy_portion_of_grid(size_of_portion_to_copy)
    temp_array = Array.new(size_of_portion_to_copy)
    (0...size_of_portion_to_copy).each do |i| 
      temp_array[i] = grid[i] 
    end
    temp_array
  end

end
