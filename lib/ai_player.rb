class AiPlayer

  def initialize(symbol)
    @symbol = symbol
  end

  def game_symbol
    symbol
  end

  def choose_move(board)
    minimax(board, true, board.vacant_indices.size).get_move
  end

  def minimax(board, is_max_player, depth)
    best_score_so_far = initial_score(is_max_player)  

    if round_is_over(board, depth)
      return score(board, depth)
    end

    board.vacant_indices.each do |i|  

      new_board = board.make_move(i, current_players_symbol(is_max_player))
      result = minimax(new_board, !is_max_player, depth - 1)
      best_score_so_far = update_score(is_max_player, i, best_score_so_far, result.get_score)
    end

    best_score_so_far
  end

  private

  attr_reader :symbol

  def round_is_over(board, depth)
    board.winning_combination? || depth == 0 
  end

  def score(board, depth) 
    winning_symbol = board.winning_symbol
    if maximizing_player_won?(winning_symbol)
      return MaximisingPlayerWin.new(depth) 
    end

    if minimizing_player_won?(winning_symbol) 
      return MinimisingPlayerWin.new(depth)
    end

    return DrawScoredMove.new
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
      best_score_so_far = MaximisingPlayerInitialScore.new
    else
      best_score_so_far = MinimisingPlayerInitialScore.new
    end
  end

  def current_players_symbol(is_max_player)
    is_max_player == true ? game_symbol : PlayerSymbols::opponent(game_symbol) 
  end

  def update_score(is_max_player, move, best_score_so_far, result_score)
    if is_max_player && (result_score >= best_score_so_far.get_score)
      return ScoredMove.new(move, result_score)
    elsif !is_max_player && (result_score < best_score_so_far.get_score)
      return ScoredMove.new(move, result_score)
    end
    return best_score_so_far
  end
end

class ScoredMove

  def initialize(move = nil, score)
    @move = move
    @score = score
  end

  def get_score
    score
  end

  def get_move
    move
  end

  private

  attr_accessor :move
  attr_accessor :score
end

class MaximisingPlayerInitialScore < ScoredMove

  def initialize(move = nil, score = -2)
    super(move, score)
  end
end

class MinimisingPlayerInitialScore < ScoredMove
  def initialize(move = nil, score = 2)
    super(move, score)
  end
end

class DrawScoredMove < ScoredMove
  def initialize(move = nil, score = 0)
    super(move, score)
  end
end

class MaximisingPlayerWin < ScoredMove
  def initialize(move = nil, score)
    super(move, 1 + score)
  end
end

class MinimisingPlayerWin < ScoredMove
  def initialize(move = nil, score)
    super(move, -1 - score)
  end
end
