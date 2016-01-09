class Board
  attr_accessor :grid 

  def initialize(symbols = Array.new(9))
    @grid = symbols
  end

  def is_empty
    !(grid.include?(:X) or grid.include?(:O))
  end

  def update(index, symbol)
    grid_before_index = copy_portion_of_grid(index)
    grid_after_index = copy_portion_of_grid(grid.size - (index + 1))  

    @grid = Array.new(grid_before_index + [symbol] + grid_after_index)
  end

  def has_free_spaces 
    grid.include?(nil)
  end
  
  # With these methods (to avoid using the @ sign in update method, all the tests fail, the setter doesn't seem to work
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
