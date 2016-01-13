require 'prompt_reader'


RSpec.describe PromptReader do

  it "reads input" do
    std_in = StringIO.new("1")
    reader = PromptReader.new(std_in)

    value = reader.getInput()
    
    expect(value).to eq "1"
  end
end
