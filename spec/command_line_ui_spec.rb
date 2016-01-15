require 'command_line_ui'
require 'board'
require 'player_symbols'
require 'player_symbols'
require 'prompt_reader'
require 'prompt_writer'

RSpec.describe CommandLineUI do
  let (:reader_spy) { instance_double(PromptReader).as_null_object }
  let (:writer_spy) { instance_double(PromptWriter).as_null_object }
  let (:command_line_ui) { command_line_ui = CommandLineUI.new(writer_spy, reader_spy)}

  it "prompts user to enter move" do
    allow(reader_spy).to receive(:get_input).and_return("1")

    command_line_ui.get_move_from_player(Board.new)

    expect(writer_spy).to have_received(:ask_for_next_move)
  end

  it "reads move from user" do
    allow(reader_spy).to receive(:get_input).and_return("1")

    expect(command_line_ui.get_move_from_player(Board.new)).to be 1 
  end

  it "shows board when asking for move" do
    allow(reader_spy).to receive(:get_input).and_return("1")

    command_line_ui.get_move_from_player(Board.new)

    expect(writer_spy).to have_received(:show_board)
  end

  it "displays error message when reprompted" do
    allow(reader_spy).to receive(:get_input).and_return("a", "3")

    command_line_ui.get_move_from_player(Board.new)  

    expect(writer_spy).to have_received(:error_message)
  end

  it "displays board with every reprompt" do
    allow(reader_spy).to receive(:get_input).and_return("a", "3")

    command_line_ui.get_move_from_player(Board.new)  

    expect(writer_spy).to have_received(:show_board).twice
  end

  it "reprompts move from user when an alpha character entered" do
    allow(reader_spy).to receive(:get_input).and_return("a", "3")

    expect(command_line_ui.get_move_from_player(Board.new)).to be 3

    expect(writer_spy).to have_received(:ask_for_next_move).twice
  end

  it "reprompts move from user when number is outside grid" do
    allow(reader_spy).to receive(:get_input).and_return("32", "7")

    expect(command_line_ui.get_move_from_player(Board.new)).to be 7

    expect(writer_spy).to have_received(:ask_for_next_move).twice
  end

  it "reprompts move from user when an occupied position is entered" do
    allow(reader_spy).to receive(:get_input).and_return("1", "2")
    board = Board.new([PlayerSymbols::X, nil, nil, nil, nil, nil, nil, nil, nil])

    expect(command_line_ui.get_move_from_player(board)).to be 2
  end

  it "reads replay option Y" do
    allow(reader_spy).to receive(:get_input).and_return("Y")

    expect(command_line_ui.replay?).to be true 

    expect(writer_spy).to have_received(:replay)
  end

  it "reads replay option y" do
    allow(reader_spy).to receive(:get_input).and_return("y")

    expect(command_line_ui.replay?).to be true 
  end

  it "replay is false when non valid option entered" do
    allow(reader_spy).to receive(:get_input).and_return("Z")

    expect(command_line_ui.replay?).to be false 

    expect(writer_spy).to have_received(:replay)
  end

  it "prints winning game status" do
    winning_board = Board.new([PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::X, nil, nil, nil, nil, PlayerSymbols::O, PlayerSymbols::O])

    command_line_ui.print_game_status(winning_board)  

    expect(writer_spy).to have_received(:show_winning_message)
  end

  it "prints winning board" do
    winning_board = Board.new([PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::X, nil, nil, nil, nil, PlayerSymbols::O, PlayerSymbols::O])

    command_line_ui.print_game_status(winning_board)  

    expect(writer_spy).to have_received(:show_board)
  end

  it "prints draw game status" do
    drawn_board = Board.new([PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::O, PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::X, PlayerSymbols::O, PlayerSymbols::O])

    command_line_ui.print_game_status(drawn_board)  

    expect(writer_spy).to have_received(:show_draw_message)
  end
end
