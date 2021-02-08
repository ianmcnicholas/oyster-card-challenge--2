class Oystercard

  Max_Balance = 90
  Min_Balance = 1

  attr_reader :balance
  #def balance
  #  @balance
  #end

  def initialize(starting_balance = 0)
    @balance = starting_balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance reached (£#{Max_Balance})" if (@balance + amount) > Max_Balance
    @balance += amount
  end

  def deduct(fare)
    fail "You do not have enough money on your card for this journey" if (@balance - fare) < 0
    @balance -= fare
  end

  def touch_in
    fail "You do not have enough money on your card for this journey" if @balance < 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
