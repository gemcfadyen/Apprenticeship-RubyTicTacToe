class AiPlayer
  def initialize(symbol)
    @symbol = symbol
  end

  def game_symbol
    symbol
  end


  def minimax(board)
    if(board.winning_combination?)
      return 1
    end
    
    if(!board.free_spaces?)
      return 0
    end
  end

  private

  attr_reader :symbol

end
