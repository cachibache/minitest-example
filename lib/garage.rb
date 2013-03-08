class Garage < Location

  def bike_in_garage? bike
    @bikes.include? bike
  end
end