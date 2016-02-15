require 'spec_helper'

describe Ttt::Core::2.0.0 do
  it 'has a version number' do
    expect(Ttt::Core::2.0.0::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
