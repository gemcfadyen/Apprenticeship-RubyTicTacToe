class Board

  def initialize(symbols = Array.new(9))
    @grid = symbols
  end

  def is_empty
    !(grid.include?(:X) or grid.include?(:O))
  end

  def make_move(index, symbol)
    grid_before_index = copy_portion_of_grid(0, index)
    grid_after_index = copy_portion_of_grid(index + 1, grid.size)   

    Board.new(Array.new(grid_before_index + [symbol] + grid_after_index))
  end

  def has_free_spaces 
    grid.include?(nil)
  end

  def get_symbol_at(position)
    grid.at(position)
  end

  def has_winning_combination
    all_row_indices = row_indices_for_3x3_grid

    has_win_for_x = check_for_winning_row_of(:X, all_row_indices) 
    has_win_for_o = check_for_winning_row_of(:O, all_row_indices)

    has_win_for_x or has_win_for_o
  end

  def check_for_winning_row_of(symbol, all_winning_combinations) 
    all_indices_of_symbol = grid.each_index.select { |v| grid[v] == symbol} 
    check_for_winning_combination_in(all_indices_of_symbol, all_winning_combinations)
  end

  def winning_symbol
    all_winning_combinations = row_indices_for_3x3_grid
    if check_for_winning_row_of(:X, all_winning_combinations) 
      return :X 
    end

    if check_for_winning_row_of(:O, all_winning_combinations) 
      return :O
    end
    :unset
  end

  def grid_for_display
    all_rows = Array.new(3) 
    offset = 0
    indices_for_rows.each do |row_indices|
      all_rows[offset] = create_row_for(row_indices)
      offset += 1
    end
    all_rows
  end

  private

  attr_reader :grid

  def create_row_for(row_indices) 
    single_row = Array.new(3)
    (0...3).each do |index| 
      row_indices.each do |row_index|
        single_row[index] = grid[row_indices[index]]
      end
    end
    single_row 
  end

  def copy_portion_of_grid(start_index, end_index)
    grid[start_index...end_index] 
  end

  def row_indices_for_3x3_grid
    all_winning_combinations = []
    all_winning_combinations += indices_for_rows 
    all_winning_combinations += indices_for_columns 
    all_winning_combinations += indices_for_diagonals
  end

  def indices_for_rows
    rows = [] 
    rows << [0, 1, 2] 
    rows << [3, 4, 5] 
    rows << [6, 7, 8]
  end

  def indices_for_columns
    columns = []
    columns << [0, 3, 6]
    columns << [1, 4, 7]
    columns << [2, 5, 8]
  end

  def indices_for_diagonals
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
