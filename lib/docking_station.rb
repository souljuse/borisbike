require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @twentybikes = []
    @capacity = capacity
  end
	def release_bike
    raise "Oh no! No bikes available!" if empty?
    raise "Oh no! No bikes available!" if @twentybikes.last.broken?
    @twentybikes.pop
	end
  def empty?
    @twentybikes.empty?
  end
  def full?
    @twentybikes.count >= @capacity
  end
	def dock(bike)
    fail 'Docking station full' if full?
		@twentybikes << bike
	end
	attr_reader :bike
  private :empty?, :full?
end
