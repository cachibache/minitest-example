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

  def test_van_empty?
    assert @van.empty?
  end

  def test_van_can_receive_a_bike
    assert @van.empty?
    @van << Bike.new
    refute @van.empty?
  end

  def test_van_can_release_a_bike
    10.times { @van << Bike.new }
    refute @van.empty?
    bike = @van.bikes[4]
    released_bike = @van.release_bike bike
    assert_equal released_bike, bike
    assert_equal 9, @van.bikes.count
  end

  def test_van_can_take_a_bike_from_specific_station
    station1, station2 = Station.new, Station.new
    bike = Bike.new
    station1 << bike
    assert station1.include? bike
    @van.take_bike_from(station1)
    assert @van.include? bike
  end


  def test_van_can_release_specific_bike
    assert @van.empty?
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    @van << bike1
    @van << bike2
    @van << bike3
    refute @van.empty?
    @van.release_bike bike2
    refute @van.include? bike2
  end

  def test_van_cannot_release_a_bike_it_does_not_have
    10.times { @van << Bike.new }
    refute @van.empty?
    bike = Bike.new
    assert_raises( RuntimeError ) { @van.release_bike bike }
  end
end