class CommandLineUI

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def get_move_from_player(board)
    value = get_user_input_for_move
      
    while !valid?(value, board) 
      writer.error_message
      value = get_user_input_for_move   
    end
    return value.to_i
  end

  def replay?
    writer.replay
    replay_option = reader.get_input()
    return replay_option.upcase == "Y"
  end

  def print_game_status(board)
    if board.has_winning_combination
      return writer.show_winning_message(board.winning_symbol)
    end

    if !board.has_free_spaces
      return writer.show_draw_message
    end
  end

  private
  attr_reader :writer
  attr_reader :reader

  def valid?(value, board)
    one_indexed(board.vacant_indices).include?(value.to_i)
  end

  def one_indexed(vacant_indices)
    vacant_indices.collect { |i| i+1 }
  end

  def get_user_input_for_move
    writer.ask_for_next_move
    reader.get_input  
  end

end
