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

    set_grid Array.new(grid_before_index + [symbol] + grid_after_index)
  end

  def has_free_spaces 
    grid.include?(nil)
  end

  def has_winning_combination
    indices_of_every_x = grid.each_index.select { |v|grid[v] == :X} 
    
    if indices_of_every_x.include?(0) and indices_of_every_x.include?(1) and indices_of_every_x.include?(2)
      true 
    elsif indices_of_every_x.include?(3) and indices_of_every_x.include?(4) and indices_of_every_x.include?(5)
      true 
    else
      false
    end
 
  end

  def grid
    @grid
  end

  private

  def set_grid(grid) #using grid=(grid) causes the tests to fail as the attribute grid is not updated
    @grid = grid
  end

  def copy_portion_of_grid(size_of_portion_to_copy)
    temp_array = Array.new(size_of_portion_to_copy)
    (0...size_of_portion_to_copy).each do |i| 
      temp_array[i] = grid[i] 
    end
    temp_array
  end
end
