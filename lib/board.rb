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
    indices_of_every_x = grid.each_index.select { |v| grid[v] == :X} 
    all_winning_combinations = all_winning_combinations_for_3x3_grid

    all_winning_combinations.each do |r|
      has_winning_combo =  r.all? { |element| indices_of_every_x.include?(element)}

      if has_winning_combo
        return true
      end
    end

    return false
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

    top_row_combination = [0, 1, 2]
    middle_row_combination = [3, 4, 5]
    bottom_row_combination = [6, 7, 8]

    left_column_combination = [0, 3, 6]
    middle_column_combination = [1, 4, 7]
    right_column_combination = [2, 5, 8]

    first_diagonal_combination = [0, 4, 8]
    second_diagonal_combination = [2, 4, 6]

    all_winning_combinations << top_row_combination
    all_winning_combinations << middle_row_combination
    all_winning_combinations << bottom_row_combination
    all_winning_combinations << left_column_combination
    all_winning_combinations << middle_column_combination 
    all_winning_combinations << right_column_combination
    all_winning_combinations << first_diagonal_combination
    all_winning_combinations << second_diagonal_combination
   
    all_winning_combinations
  end
end
