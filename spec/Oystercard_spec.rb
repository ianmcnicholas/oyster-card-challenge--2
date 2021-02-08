require './lib/Oystercard.rb'

describe Oystercard do

  it "initializes with a default starting balance of 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end


end
