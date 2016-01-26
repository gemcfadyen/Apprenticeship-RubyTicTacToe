require 'valid_player_option_finder'
require 'prompt_reader'
require 'prompt_writer'
require 'player_symbols'

RSpec.describe ValidPlayerOptionFinder do
  let (:reader_spy) { instance_double(PromptReader).as_null_object }
  let (:writer_spy) { instance_double(PromptWriter).as_null_object }
  let (:valid_player_option_finder) { ValidPlayerOptionFinder.new(reader_spy, writer_spy) }

  it "reads in player option" do
    allow(reader_spy).to receive(:get_input).and_return("1")

    expect(valid_player_option_finder.validated_input).to be PlayerOptions::HUMAN_VS_HUMAN
    expect(writer_spy).to have_received(:show_player_options)
  end

  it "reprompts when invalid player option entered" do
    allow(reader_spy).to receive(:get_input).and_return("A", "1")

    valid_player_option_finder.validated_input

    expect(writer_spy).to have_received(:error_message)
  end

 it "reprompts player option from user when number is not a valid player type" do
    allow(reader_spy).to receive(:get_input).and_return("32", "1")

    expect(valid_player_option_finder.validated_input).to be PlayerOptions::HUMAN_VS_HUMAN

    expect(writer_spy).to have_received(:show_player_options).twice
    expect(reader_spy).to have_received(:get_input).twice
  end
end
