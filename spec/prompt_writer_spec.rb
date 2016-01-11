require 'prompt_writer'

RSpec.describe PromptWriter do
  before (:each) do
    @std_out = StringIO.new
    @prompt = PromptWriter.new(@std_out)
  end

  it "prompts for an input" do
    @prompt.ask_for_next_move

    expect(@std_out.string).to eq "Please enter your next move\n"
  end

  it "displays winning message" do
    @prompt.show_winning_message 
    expect(@std_out.string).to eq "The game has been won!\n"
  end

  it "displays draw message" do
    @prompt.show_draw_message
    expect(@std_out.string).to eq "The game is a draw!\n"
  end
end
