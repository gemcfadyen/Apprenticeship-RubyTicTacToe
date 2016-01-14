require 'command_line_ui'

RSpec.describe CommandLineUI do

  it "reads move from user" do
    reader_spy = instance_double("PromptReader")
    writer_spy = instance_double("PromptWriter")

    expect(writer_spy).to receive(:ask_for_next_move)
    expect(reader_spy).to receive(:get_input)

    command_line_ui = CommandLineUI.new(writer_spy, reader_spy)

    move = command_line_ui.get_move_from_player

  end
end
