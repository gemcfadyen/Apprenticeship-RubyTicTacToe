require 'input_validator'

class ValidMoveFinder < InputValidator

  def initialize(board, reader, writer)
    @board = board
    @reader = reader
    @writer = writer
  end

  def prompt_user
    writer.show_board(board)
    writer.ask_for_next_move
  end

  def reprompt
    writer.show_board(board)
    writer.error_message
    writer.ask_for_next_move
  end

  def convert(value)
    zero_indexed(Integer(value))
  end

  def valid?(value)
    numeric?(value) ? one_indexed(board.vacant_indices).include?(Integer(value)) : false
  end

  private

  attr_reader :board, :reader, :writer

  def one_indexed(vacant_indices)
    vacant_indices.collect { |i| i + 1 }
  end

  def zero_indexed(value)
    value - 1
  end
end
