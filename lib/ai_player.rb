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
    p "inside minimax with board " + board.grid_for_display.to_s

    best_score_so_far = initial_score(is_max_player)  

    if round_is_over(board, depth)
      return score(board, depth)
    end

    board.vacant_indices.each do |i|  
      p " is_max_player: " + is_max_player.to_s + "  vacant index " + i.to_s

      new_board = board.make_move(i, current_players_symbol(is_max_player))
      result = minimax(new_board, !is_max_player, depth - 1)

      p "returned from minimax..."
      best_score_so_far = update_score(is_max_player, i, best_score_so_far, result.get_score)
    end

    p "final score and move " + best_score_so_far.get_score.to_s + " " + best_score_so_far.get_move.to_s
    best_score_so_far
  end

  private

  attr_reader :symbol

  def round_is_over(board, depth)
     board.winning_combination? || depth == 0 
  end

  def score(board, depth) 
    if board.winning_symbol == game_symbol
      return ScoredMove.new(nil, 1 + depth)
    end

    if board.winning_symbol == PlayerSymbols::opponent(game_symbol)
      return ScoredMove.new(nil, -1 - depth)
    end
    return ScoredMove.new(nil, 0)
  end

  def initial_score(is_max_player)
    if is_max_player
      best_score_so_far = ScoredMove.new(nil, -2)
    else
      best_score_so_far = ScoredMove.new(nil, 2)
    end
  end

  def current_players_symbol(is_max_player)
    (is_max_player == true) ? game_symbol : PlayerSymbols::opponent(game_symbol) 
  end

  def update_score(is_max_player, move, best_score_so_far, result_score)
    if(is_max_player && (result_score >= best_score_so_far.get_score))
      p "max player - setting move to: " + move.to_s
      p "max player - setting score to: " + result_score.to_s

      return ScoredMove.new(move, result_score)
    elsif !is_max_player && (result_score < best_score_so_far.get_score)
      p "min player - setting move to: " + move.to_s
      p "min player - setting score to: " + result_score.to_s

      return ScoredMove.new(move, result_score)
    end
    return best_score_so_far
  end
end

class ScoredMove
  def initialize 
  end

  def initialize(move, score)
    @move = move
    @score = score
  end

  def get_score
    score
  end

  def get_move
    move
  end

  def set_move(move)
    @move = move
  end

  def set_score(score)
    @score = score 
  end

  private

  attr_accessor :move
  attr_accessor :score
end

