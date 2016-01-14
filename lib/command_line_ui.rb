class CommandLineUI

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def get_move_from_player
    writer.ask_for_next_move
    reader.get_input
  end

  private

  attr_reader :writer
  attr_reader :reader
end
