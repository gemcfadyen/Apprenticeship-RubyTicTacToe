require 'prompt_writer'

RSpec.describe PromptWriter do

  it "prompts for an input" do
    std_out = StringIO.new 
    prompt = PromptWriter.new(std_out)
    prompt.ask_for_next_move

    expect(std_out.string).to eq "Please enter your next move\n"
  end
end
