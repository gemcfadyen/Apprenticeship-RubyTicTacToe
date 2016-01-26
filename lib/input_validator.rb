class InputValidator

  def validated_input
    prompt_user
    value = read_input

    while !valid?(value)
      reprompt
      value = read_input
    end
    convert(value)
  end

  def numeric?(input)
    begin
      Integer(input)
      true
    rescue ArgumentError
      false
    end
  end

  private

  def read_input
    reader.get_input
  end
end


