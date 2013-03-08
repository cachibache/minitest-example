require './lib/location'
require './lib/station'
require './lib/bike'
require './lib/person' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestPerson < MiniTest::Unit::TestCase

  def setup
    @person = Person.new
  end

  def test_person_has_bike?
    refute @person.has_bike?
  end

  def test_person_can_take_a_bike_from_specific_station
    refute @person.has_bike?
    station1, station2 = Station.new, Station.new
    bike = Bike.new
    station1 << bike
    assert station1.include? bike
    @person.take_bike_from(station1)
    assert @person.has_bike?
  end

  def test_person_can_return_a_bike
    bike = Bike.new
    station = Station.new
    @person.take_bike_from(station)
    assert @person.has_bike?
    @person.release_bike bike
    refute @person.has_bike?
  end
end