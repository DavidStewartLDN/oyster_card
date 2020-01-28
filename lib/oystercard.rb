class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end