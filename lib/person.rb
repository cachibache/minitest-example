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

  def release_bike(bike)
    @bike = nil
  end

  def take_bike_from(station)
    bike = station.bikes.first
    @bike = station.release_bike bike
  end
end