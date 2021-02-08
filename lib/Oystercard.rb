class Oystercard
  Max_Balance = 90

  attr_reader :balance
  #def balance
  #  @balance
  #end

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def top_up(amount)

    fail "Maximum balance reached (£90)" if (@balance + amount) > Max_Balance
    @balance += amount

  end

end
