require './lib/Oystercard.rb'

describe Oystercard do

  it "initializes with a default starting balance of 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it "is intially not in a journey" do
    oystercard = Oystercard.new
    expect(oystercard).not_to be_in_journey
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

  it "should respond deduct with 1 argument" do
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  describe "#fare" do
    it "should reduce the balance" do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      oystercard.deduct(5)
      expect(oystercard.balance).to eq 5
    end

    it "should throw an error if there is not enough money on the card to pay fare" do
      oystercard = Oystercard.new
      oystercard.top_up(1)
      expect { oystercard.deduct(2) }.to raise_error "You do not have enough money on your card for this fare"
    end
  end

  it "should respond to touch_in" do
    expect(subject).to respond_to(:touch_in)
  end

  it "should respond to touch_out" do
    expect(subject).to respond_to(:touch_out)
  end

  it "should respond to in_journey" do
    expect(subject).to respond_to(:in_journey?)
  end

  describe "#in_journey" do
    it "expects a user to be in a journey after they have touched in" do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it "expects a user to not be in a journey if they have touched out" do
      oystercard = Oystercard.new
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end

end
