require_relative 'garage'
require_relative 'docking_station'
require_relative 'bike'

class Van
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @van_bikes = []
    @capacity = capacity
  end
  def broken?
    @van_bikes.last.broken?
  end
	def unload_bike(bike)
    raise "No bikes on the van" if empty?
    @twentybikes << bike if !broken?
    @garage_bikes << bike if broken?
	end
  def empty?
    @van_bikes.empty?
  end
  def full?
    @van_bikes.count >= @capacity
  end
	def load_bike(bike)
    fail 'Van full' if full?
		@van_bikes << bike
	end

	attr_reader :bike
  private :empty?, :full?
end
