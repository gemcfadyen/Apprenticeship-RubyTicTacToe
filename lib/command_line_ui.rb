require 'prompt_writer'
require 'prompt_reader'
require 'player_options'
require 'valid_move_finder'
require 'valid_player_option_finder'

class CommandLineUI

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def get_move_from_player(board)
    ValidMoveFinder.new(board, reader, writer).validated_input
  end

  def get_player_option
    ValidPlayerOptionFinder.new(reader, writer).validated_input
  end

  def replay?
    writer.replay
    replay_option = reader.get_input()
    replay_option.upcase == ReplayOption::Y
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

  attr_reader :writer, :reader

end
