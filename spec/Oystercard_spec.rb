require './lib/Oystercard.rb'

describe Oystercard do

  it "initializes with a default starting balance of 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it "should respond to the method top_up with 1 arg" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  describe "#top_up" do

    it "should top up the balance" do
      oystercard = Oystercard.new
      oystercard.top_up(1)
      expect(oystercard.balance).to eq 1
    end

    it "should throw an error if the balance exceeds £90" do
    oystercard = Oystercard.new
    oystercard.top_up(Oystercard::Max_Balance)
    expect { oystercard.top_up(1) }.to raise_error "Maximum balance reached (£#{Oystercard::Max_Balance})"
    end

  end

end
