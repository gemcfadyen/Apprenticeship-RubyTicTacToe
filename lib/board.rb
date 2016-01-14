class Board

  def initialize(symbols = Array.new(9))
    @grid = symbols
  end

  def is_empty
    !(grid.include?(PlayerSymbols::X) or grid.include?(PlayerSymbols::O))
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
    has_winning_combination_within(all_rows)
  end

  def winning_symbol
    winning_row = find_winning_row_from(all_rows)
    winning_row.nil? ? nil : winning_row.first 
  end

  def grid_for_display
    rows
  end

  private

  attr_reader :grid

  def copy_portion_of_grid(start_index, end_index)
    grid[start_index...end_index] 
  end

  def has_winning_combination_within(all_rows) 
    has_row_of_matching_symbols_within(all_rows) 
  end

  def has_row_of_matching_symbols_within(all_rows)
    has_winning_row(all_rows) ? true : false
  end

  def has_winning_row(all_rows)
    not_nil_row(find_winning_row_from(all_rows))
  end

  def find_winning_row_from(rows)
    all_rows.each do |row| 
      all_cells_match = row.all? {|cell| cell == row.first}
      return row if all_cells_match and not_nil_symbol(row.first)
    end 
    return nil
  end

  def not_nil_row(row)
    !row.nil?
  end
  def all_rows
    all_rows = []
    all_rows += rows 
    all_rows += columns 
    all_rows += diagonals
  end

  def not_nil_symbol(cell)
    !cell.nil?
  end

  def rows
    rows = [] 
    rows << [grid.at(0), grid.at(1), grid.at(2)] 
    rows << [grid.at(3), grid.at(4), grid.at(5)] 
    rows << [grid.at(6), grid.at(7), grid.at(8)]
  end

  def columns
    columns = []
    columns << [grid.at(0), grid.at(3), grid.at(6)]
    columns << [grid.at(1), grid.at(4), grid.at(7)]
    columns << [grid.at(2), grid.at(5), grid.at(8)]
  end

  def diagonals
    diagonals = []
    diagonals << [grid.at(0),grid.at(4), grid.at(8)]
    diagonals << [grid.at(2), grid.at(4), grid.at(6)]
  end

end
