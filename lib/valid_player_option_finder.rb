require 'input_validator'
require 'player_options'

class ValidPlayerOptionFinder < InputValidator
  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def prompt_user
    writer.show_player_options
  end

  def reprompt
    writer.error_message
    prompt_user
  end

  def convert(value)
    PlayerOptions::get_player_type_for_id(Integer(value))
  end

  def valid?(value)
    numeric?(value) ? PlayerOptions::valid_ids.include?(Integer(value)) : false
  end

  private

  attr_reader :reader, :writer
end


