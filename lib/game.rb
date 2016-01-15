class Game

  def initialize(board, players)
    @board = board
    @players = players
  end

  def play 
    current_player_index = 0
    p board.grid_for_display

    while game_in_progress
      current_player = players[current_player_index]
      @board = board.make_move(current_player.choose_move(board), current_player.game_symbol)  
      p board.grid_for_display 
      
      current_player_index = toggle_player(current_player_index)
    end
  end

  private

  attr_reader :board, :players

  def game_in_progress
    inprog = board.free_spaces? && !board.winning_combination?
    p inprog
    inprog
  end

  def toggle_player(current_player_index)
    current_player_index == 1 ? 0 : 1
  end
end
