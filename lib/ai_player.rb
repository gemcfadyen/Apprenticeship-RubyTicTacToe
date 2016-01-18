class AiPlayer
  def initialize(symbol)
    @symbol = symbol
  end

  def game_symbol
    symbol
  end

  def choose_move(board)
    minimax(boar)
  end

  def minimax(board)
    if board.winning_combination?
      if board.winning_symbol == game_symbol
        return 1
      else 
        return -1
      end
    end

    if !board.free_spaces?
      return 0
    end
  end

  private

  attr_reader :symbol

end
