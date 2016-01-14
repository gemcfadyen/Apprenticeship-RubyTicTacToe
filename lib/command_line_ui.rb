class CommandLineUI

  def initialize(writer, reader)
    @writer = writer
    @reader = reader
  end

  def get_move_from_player
    writer.ask_for_next_move
    value = reader.get_input  

    while not_an_integer(value) 
      writer.ask_for_next_move
      value = reader.get_input 
    end
    return value.to_i
  end

  private

  def not_an_integer(value)
    !(true if Integer(value) rescue false)
  end

  attr_reader :writer
  attr_reader :reader
end
