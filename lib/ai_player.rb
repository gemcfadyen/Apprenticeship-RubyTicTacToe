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

    # heuristic scoring 
    if board.winning_combination?
      p "has winning combination."
      if board.winning_symbol == game_symbol
        p "winner for X"
        return ScoredMove.new(nil, 1 + depth)
      else 
        p "winner for O"
        return ScoredMove.new(nil, -1 + depth)
      end
    end

    if !board.free_spaces?
      return ScoredMove.new(nil, 0)
    end

    # recursive moves
    best_score_so_far = nil 
    if is_max_player
      best_score_so_far = ScoredMove.new(nil, -2)
    else
      best_score_so_far = ScoredMove.new(nil, 2)
    end

    board.vacant_indices.each do |i|  
      p "vacant index " + i.to_s
      symbol_for_minimax =  (is_max_player == true) ? PlayerSymbols::X : PlayerSymbols::O
      p "symbol is" + symbol_for_minimax.to_s
      new_board = board.make_move(i,symbol_for_minimax)
      p "call minimax again..."
      result = minimax(new_board, !is_max_player, depth - 1)
      p "returned from minimax..."

      if(is_max_player && (result.get_score > best_score_so_far.get_score))
        p "is max player with larger score" 
        best_score_so_far = ScoredMove.new(i, result.get_score)
      elsif !is_max_player && (result.get_score < best_score_so_far.get_score)
        p "is min player with larger score" 
        best_score_so_far = ScoredMove.new(i, result.get_score)
      end
    end
    
    p "final score and move " + best_score_so_far.get_score.to_s + " " + best_score_so_far.get_move.to_s
    best_score_so_far
  end
  private

  attr_reader :symbol

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

