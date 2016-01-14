require 'command_line_ui'

RSpec.describe CommandLineUI do

  before (:each) do
    @reader_spy = instance_double("PromptReader")
    @writer_spy = instance_double("PromptWriter")
  end

  it "reads move from user" do
    user_input = "1\n"
    expect(@writer_spy).to receive(:ask_for_next_move)
    expect(@reader_spy).to receive(:get_input).and_return(user_input)

    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    move = command_line_ui.get_move_from_player
    expect(move).to be user_input 
  end
end
