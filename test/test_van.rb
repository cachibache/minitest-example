require './lib/location'
require './lib/station'
require './lib/bike'
require './lib/van' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestVan < MiniTest::Unit::TestCase


  def setup
    @van = Van.new
  end

  def test_van_can_take_a_bike_from_specific_station
    station1, station2 = Station.new, Station.new
    bike = Bike.new
    station1 << bike
    assert station1.include? bike
    @van.take_bike_from(station1)
    assert @van.include? bike
  end
end
