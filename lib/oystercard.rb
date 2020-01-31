require_relative "journey.rb"

class Oystercard
  
  attr_reader :balance, :entry_station, :exit_station, :journey, :journeys
  
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FEE = 2
  
  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    journey.journey_start=(station)
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FEE)
    @exit_station = station
    @journey = {entry_station: @entry_station, exit_station: @exit_station}
    @journeys << @journey
    @entry_station = nil
  end 

  private

  def deduct(amount)
    @balance -= amount
  end

end