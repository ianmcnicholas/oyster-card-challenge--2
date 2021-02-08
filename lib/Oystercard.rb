class Oystercard

  attr_reader :balance
  #def balance
  #  @balance
  #end

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

end
