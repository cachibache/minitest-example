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
    bike = Bike.new
    @station << bike
    refute @station.empty?
    @station.release_bike(bike)
    assert @station.empty?
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
end