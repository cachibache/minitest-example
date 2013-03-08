class Van < Location

  def bike_in_van? bike
    @bikes.include? bike
  end
end