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
    all_rows = rows_for_3x3_grid

    has_win_for_x = check_for_winning_row_of(:X, all_rows) 
    has_win_for_o = check_for_winning_row_of(:O, all_rows)

    has_win_for_x or has_win_for_o
  end

  def check_for_winning_row_of(symbol, all_rows) 
    has_row_of_matching_symbols_within(all_rows) 
  end

  def has_row_of_matching_symbols_within(all_rows)
    all_rows.each do |row| 
      puts 'row is: ' + row.to_s
      all_cells_match = row.all? {|cell| cell == row[0]}
      if all_cells_match and not_nil_symbol(row[0])
        return true
      end
    end 
    return false
  end

  def not_nil_symbol(cell)
    !cell.nil?
  end

  def winning_symbol
    rows_for_3x3_grid.each do |row| 
      all_cells_match = row.all? {|cell| cell == row[0]}
      if all_cells_match and not_nil_symbol(row[0])
        return row[0]
      end
    end 
    return nil
  end

  def grid_for_display
    indices_for_rows
  end

  private

  attr_reader :grid

  def copy_portion_of_grid(start_index, end_index)
    grid[start_index...end_index] 
  end

  def rows_for_3x3_grid
    all_rows = []
    all_rows += indices_for_rows 
    all_rows += indices_for_columns 
    all_rows += indices_for_diagonals
  end

  def does_row_match_condition
    rows_for_3x3_grid.each do |row| 
      all_cells_match = row.all? {|cell| cell == row[0]}
      if all_cells_match and not_nil_symbol(row[0])
        return row[0]
      end
    end 
    return nil
  end

  def indices_for_rows
    rows = [] 
    rows << [grid.at(0), grid.at(1), grid.at(2)] 
    rows << [grid.at(3), grid.at(4), grid.at(5)] 
    rows << [grid.at(6), grid.at(7), grid.at(8)]
  end

  def indices_for_columns
    columns = []
    columns << [grid.at(0), grid.at(3), grid.at(6)]
    columns << [grid.at(1), grid.at(4), grid.at(7)]
    columns << [grid.at(2), grid.at(5), grid.at(8)]
  end

  def indices_for_diagonals
    diagonals = []
    diagonals << [grid.at(0),grid.at(4), grid.at(8)]
    diagonals << [grid.at(2), grid.at(4), grid.at(6)]
  end

end
