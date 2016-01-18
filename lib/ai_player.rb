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

    if round_is_over(board, depth)
      return score(board, depth)
    end

    best_score_so_far = initial_score(is_max_player)  

    board.vacant_indices.each do |i|  
      p "vacant index " + i.to_s
      symbol_for_minimax =  (is_max_player == true) ? game_symbol : PlayerSymbols::opponent(game_symbol) 
      p "symbol is" + symbol_for_minimax.to_s
      new_board = board.make_move(i,symbol_for_minimax)
      p "call minimax again..."
      result = minimax(new_board, !is_max_player, depth - 1)
      p "returned from minimax..."

      if(is_max_player && (result.get_score > best_score_so_far.get_score))
        best_score_so_far = ScoredMove.new(i, result.get_score)
        p "best score for max player is : " + best_score_so_far.get_score.to_s + " with move : " + best_score_so_far.get_move.to_s
      elsif !is_max_player && (result.get_score < best_score_so_far.get_score)
        best_score_so_far = ScoredMove.new(i, result.get_score)
        p "best score for min player is : " + best_score_so_far.get_score.to_s + " with move : " + best_score_so_far.get_move.to_s
      end
    end

    p "final score and move " + best_score_so_far.get_score.to_s + " " + best_score_so_far.get_move.to_s
    best_score_so_far
  end

  private

  attr_reader :symbol

  def round_is_over(board, depth)
    depth == 0 || board.winning_combination?
  end

  def score(board, depth) 
    if board.winning_symbol == game_symbol
      return ScoredMove.new(nil, 1 + depth)
    end

    if board.winning_symbol == PlayerSymbols::opponent(game_symbol)
      return ScoredMove.new(nil, -1 + depth)
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

  private

  attr_reader :move
  attr_reader :score
end

