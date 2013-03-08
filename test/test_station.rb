require './lib/location'
require './lib/bike'
require './lib/station' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestStation < MiniTest::Unit::TestCase

  def setup
    @station = Station.new
  end

  def test_station_empty?
    assert @station.empty?
  end

  def test_station_can_receive_a_bike
    assert @station.empty?
    @station << Bike.new
    refute @station.empty?
  end

  def test_station_can_release_a_bike
    10.times { @station << Bike.new }
    refute @station.empty?
    bike = @station.bikes[3]
    released_bike = @station.release_bike bike
    assert_equal released_bike, bike
    assert_equal 9, @station.bikes.count
  end

  def test_how_many_broken_bikes_station_has
    bike1, bike2 = Bike.new, Bike.new
    @station << bike1
    @station << bike2
    bike1.break!
    assert bike1.broken?
    assert_equal 1, @station.broken_bikes.count
  end

  def test_how_many_working_bikes_station_has
    bike1, bike2 = Bike.new, Bike.new
    @station << bike1
    @station << bike2
    refute bike1.broken?
    refute_equal 1, @station.broken_bikes.count
  end

  def test_station_cannot_release_a_bike_it_does_not_have
    10.times { @station << Bike.new }
    refute @station.empty?
    bike = Bike.new
    assert_raises( RuntimeError ) { @station.release_bike bike }
  end
end