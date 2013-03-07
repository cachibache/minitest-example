class Van

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

  def bike2_not_in_van?
    @bikes[1]
  end
end