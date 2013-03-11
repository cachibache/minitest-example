class Location

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def empty?
    @bikes.empty?
  end

  def << bike
    @bikes << bike
  end

  def release_bike(bike)
    raise "No such bike" unless include?(bike)
    @bikes.delete bike
  end

  def include?(bike)
    @bikes.include? bike
  end

  def take_bike_from(location)
    bike = location.bikes.first
    released_bike = location.release_bike bike
    self << released_bike
  end
end