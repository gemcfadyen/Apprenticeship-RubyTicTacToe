require 'player_symbols'
require 'player'

class AiPlayer
  include Player

  def initialize(symbol)
    super(symbol)
  end

  def choose_move(board)
    minimax(board, true, board.vacant_indices.size).first[1]
  end

  def minimax(board, is_max_player, depth)
    best_score_so_far = initial_score(is_max_player)

    if round_is_over(board, depth)
      return score(board, depth)
    end

    board.vacant_indices.each do |i|
      new_board = board.make_move(i, current_players_symbol(is_max_player))
      result = minimax(new_board, !is_max_player, depth - 1)
      best_score_so_far = update_score(is_max_player, i, best_score_so_far, result.first[0])
    end
    best_score_so_far
  end

  private

  def round_is_over(board, depth)
    board.winning_combination? || depth == 0
  end

  def score(board, depth)
    winning_symbol = board.winning_symbol
    if maximizing_player_won?(winning_symbol)
      return {(1 + depth) => nil}
    end

    if minimizing_player_won?(winning_symbol)
      return {(-1 - depth) => nil}
    end

    return {0 => nil}
  end

  def maximizing_player_won?(winners_symbol)
    symbols_are_equal?(winners_symbol, game_symbol)
  end

  def minimizing_player_won?(winners_symbol)
    symbols_are_equal?(winners_symbol, PlayerSymbols::opponent(game_symbol))
  end

  def symbols_are_equal?(symbol1, symbol2)
    symbol1 == symbol2
  end

  def initial_score(is_max_player)
    if is_max_player
      best_score_so_far = {-2 => nil}
    else
      best_score_so_far = {2 => nil}
    end
  end

  def current_players_symbol(is_max_player)
    is_max_player == true ? game_symbol : PlayerSymbols::opponent(game_symbol)
  end

  def update_score(is_max_player, move, best_score_so_far, result_score)
    if is_max_player && (result_score >= best_score_so_far.first[0])
      return {result_score => move}
    elsif !is_max_player && (result_score < best_score_so_far.first[0])
      return {result_score => move}
    end
    return best_score_so_far
  end
end
