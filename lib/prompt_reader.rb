class PromptReader
  attr_reader :std_in

  def initialize(std_in)
    @std_in = std_in
  end

  def get_input()
    std_in.gets.chomp
  end
end
