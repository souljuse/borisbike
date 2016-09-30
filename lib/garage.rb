require_relative 'bike'
require_relative 'van'

class Garage
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @garage_bikes = []
    @capacity = capacity
  end
	def release_fixed_bike
    raise "Sorry, the garage has no bikes at all." if empty?
    raise "Sorry, there are no fixed bikes." if @garage_bikes.last.broken?
    @garage_bikes.pop
	end
  def empty?
    @garage_bikes.empty?
  end
  def full?
    @garage_bikes.count >= @capacity
  end
	def dock(bike)
    fail 'Garage full' if full?
		@garage_bikes << bike
	end

	attr_reader :bike
  private :empty?, :full?
end
