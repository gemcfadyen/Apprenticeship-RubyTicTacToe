require 'command_line_ui'
require 'board'
require 'player_symbols'
require 'player_symbols'

RSpec.describe CommandLineUI do

  before (:each) do
    @reader_spy = instance_double("PromptReader")
    @writer_spy = instance_double("PromptWriter")
  end

  it "reads move from user" do
    expect(@writer_spy).to receive(:ask_for_next_move)
    expect(@reader_spy).to receive(:get_input).and_return("1")

    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.get_move_from_player(Board.new)).to be 1 
  end

  it "reprompts move from user when an alpha character entered" do
    expect(@writer_spy).to receive(:ask_for_next_move).twice
    expect(@reader_spy).to receive(:get_input).and_return("a", "3")
    expect(@writer_spy).to receive(:error_message).once
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.get_move_from_player(Board.new)).to be 3
  end

  it "reprompts move from user when number is outside grid" do
    expect(@writer_spy).to receive(:ask_for_next_move).twice
    expect(@reader_spy).to receive(:get_input).and_return("32", "7")
    expect(@writer_spy).to receive(:error_message).once
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.get_move_from_player(Board.new)).to be 7
  end

  it "reprompts move from user when an occupied position is entered" do
    expect(@writer_spy).to receive(:ask_for_next_move).twice
    expect(@reader_spy).to receive(:get_input).and_return("1", "2")
    expect(@writer_spy).to receive(:error_message).once
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    board = Board.new([PlayerSymbols::X, nil, nil, nil, nil, nil, nil, nil, nil])
    expect(command_line_ui.get_move_from_player(board)).to be 2
  end

  it "reads replay option Y" do
    expect(@writer_spy).to receive(:replay)
    expect(@reader_spy).to receive(:get_input).and_return("Y")
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.replay?).to be true 
  end

  it "reads replay option y" do
    expect(@writer_spy).to receive(:replay)
    expect(@reader_spy).to receive(:get_input).and_return("y")
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.replay?).to be true 
  end

  it "reprompts when invalid replay option provided" do
    expect(@writer_spy).to receive(:replay)
    expect(@reader_spy).to receive(:get_input).and_return("Z")
    command_line_ui = CommandLineUI.new(@writer_spy, @reader_spy)

    expect(command_line_ui.replay?).to be false 
  end
end
