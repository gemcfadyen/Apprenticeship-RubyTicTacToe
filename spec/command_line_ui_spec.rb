require 'command_line_ui'

RSpec.describe CommandLineUI do

  before (:each) do
    @reader_spy = instance_double("PromptReader")
    @writer_spy = instance_double("PromptWriter")
  end

  it "reads move from user" do
    expect(@writer_spy).to receive(:ask_for_next_move)
    expect(@reader_spy).to receive(:get_input).and_return("1\n")

    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.get_move_from_player).to be 1 
  end

  it "reprompts move from user when an alpha character entered" do
    expect(@writer_spy).to receive(:ask_for_next_move).twice
    expect(@reader_spy).to receive(:get_input).and_return("a\n", "3\n")
    expect(@writer_spy).to receive(:error_message).once
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.get_move_from_player).to be 3
  end
end
