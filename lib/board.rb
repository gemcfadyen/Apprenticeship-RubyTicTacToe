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
    all_winning_combinations = all_winning_combinations_for_3x3_grid

    indices_of_every_x = grid.each_index.select { |v| grid[v] == :X} 
    indices_of_every_o = grid.each_index.select { |v| grid[v] == :O} 

    has_win_for_x = check_for_winning_combination_in(indices_of_every_x, all_winning_combinations)
    has_win_for_o = check_for_winning_combination_in(indices_of_every_o, all_winning_combinations)

    return (has_win_for_x or has_win_for_o)
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

  def all_winning_combinations_for_3x3_grid
    all_winning_combinations = []
    all_winning_combinations += indices_for_winning_rows 
    all_winning_combinations += indices_for_winning_columns 
    all_winning_combinations += indices_for_winning_diagonals
  end

  def indices_for_winning_rows
    rows = [] 
    rows << [0, 1, 2] 
    rows << [3, 4, 5] 
    rows << [6, 7, 8]
  end

  def indices_for_winning_columns
    columns = []
    columns << [0, 3, 6]
    columns << [1, 4, 7]
    columns << [2, 5, 8]
  end

  def indices_for_winning_diagonals
    diagonals = []
    diagonals << [0, 4, 8]
    diagonals << [2, 4, 6]
  end
  
  def check_for_winning_combination_in(positions, all_winning_combinations)
    all_winning_combinations.each do |r|
      has_winning_combo =  r.all? { |element| positions.include?(element) }

      if has_winning_combo
        return true
      end
    end
    return false
  end
end
