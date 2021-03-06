class Game

  def initialize(board, players)
    @board = board
    @players = players
  end

  def play
    while game_in_progress?
      current_player = players[player_symbol]
      @board = board.make_move(current_player.choose_move(board), player_symbol)
    end
    board
  end

  def play_specific(move)
    @board = board.make_move(move, player_symbol)
    play
  end

  private

  attr_reader :board, :players

  def player_symbol
    number_of_x = board.grid_for_display.flatten.count(PlayerSymbols::X)
    number_of_o = board.grid_for_display.flatten.count(PlayerSymbols::O)
    next_players_symbol = number_of_x > number_of_o ? PlayerSymbols::O : PlayerSymbols::X
  end

  def game_in_progress?
    players[player_symbol].ready? && board.free_spaces? && !board.winning_combination?
  end

end
