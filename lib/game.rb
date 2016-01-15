class Game

  def initialize(board, players)
    @board = board
    @players = players
  end

  def play 
    current_player_index = 0
    while(board.free_spaces? && !board.winning_combination?)
      current_player = players[current_player_index]
      @board = board.make_move(current_player.choose_move(board), current_player.game_symbol)  
      current_player_index = toggle_player(current_player_index)
    end
  end

  private

  attr_reader :board
  attr_reader :players

  def toggle_player(current_player_index)
    current_player_index == 1 ? 0 : 1
  end
end
