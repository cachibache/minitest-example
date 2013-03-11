class Person

  def initialize
    @bike = nil
  end

  def has_bike?
    @bike
  end

  def << bike
    @bike = bike
  end

  def release_bike(bike=nil)
    @bike = nil
  end

  def take_bike_from(station)
    bike = station.bikes.first
    released_bike = station.release_bike bike
    self << released_bike
  end
end