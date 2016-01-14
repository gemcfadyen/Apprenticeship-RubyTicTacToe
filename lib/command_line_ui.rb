class CommandLineUI

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def get_move_from_player(board)
    writer.show_board(board)
    value = get_user_input_for_move
    
    get_valid_value_after_reprompt(value, board)
  end

  def replay?
    writer.replay
    replay_option = reader.get_input()
    replay_option.upcase == "Y"
  end

  def print_game_status(board)
    writer.show_board(board)
    if board.winning_combination?
      return writer.show_winning_message(board.winning_symbol)
    end

    if !board.free_spaces?
      return writer.show_draw_message
    end
  end

  private

  attr_reader :writer
  attr_reader :reader

  def get_user_input_for_move
    writer.ask_for_next_move
    reader.get_input  
  end

  def get_valid_value_after_reprompt(value, board)
    while !valid?(value, board) 
      writer.error_message
      writer.show_board(board)
      value = get_user_input_for_move   
    end
    value.to_i    
  end

  def valid?(value, board)
    one_indexed(board.vacant_indices).include?(value.to_i)
  end

  def one_indexed(vacant_indices)
    vacant_indices.collect { |i| i+1 }
  end

 
end
