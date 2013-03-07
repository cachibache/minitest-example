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

  def release_bike bike
    @bike = nil
  end
end