require 'valid_move_finder'
require 'prompt_reader'
require 'prompt_writer'
require 'board'
require 'player_symbols'

RSpec.describe ValidMoveFinder do
  let (:reader_spy) { instance_double(PromptReader).as_null_object }
  let (:writer_spy) { instance_double(PromptWriter).as_null_object }
  let (:valid_move_finder) { ValidMoveFinder.new(Board.new, reader_spy, writer_spy)}

  it "prompts user to enter move" do
    allow(reader_spy).to receive(:get_input).and_return("1")

    value = valid_move_finder.validated_input

    expect(value).to eq 0
    expect(writer_spy).to have_received(:show_board)
    expect(writer_spy).to have_received(:ask_for_next_move)
  end


  it "reprompts when non numeric move entered" do
    allow(reader_spy).to receive(:get_input).and_return("a", "1")

    value = valid_move_finder.validated_input

    expect(value).to eq 0
    expect(writer_spy).to have_received(:show_board).twice
    expect(writer_spy).to have_received(:ask_for_next_move).twice
    expect(writer_spy).to have_received(:error_message)
  end

  it "reprompts when already occupied move entered" do
    valid_move_finder =  ValidMoveFinder.new(Board.new([PlayerSymbols::X, nil, nil, nil, nil, nil, nil, nil, nil]), reader_spy, writer_spy)

    allow(reader_spy).to receive(:get_input).and_return("1", "7")

    value = valid_move_finder.validated_input

    expect(value).to eq 6
    expect(writer_spy).to have_received(:show_board).twice
    expect(writer_spy).to have_received(:ask_for_next_move).twice
    expect(writer_spy).to have_received(:error_message)
  end


end
