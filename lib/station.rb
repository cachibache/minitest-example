class Station

  def initialize
    @bikes = []
  end

  def empty?
    @bikes.empty?
  end

  def << bike
    @bikes << bike
  end

  def release_bike bike
    @bikes.delete bike
  end

  def broken_bikes
    @bikes.select { |bike| bike if bike.broken? }
  end
end