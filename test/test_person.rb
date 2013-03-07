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

  def test_person_can_take_a_bike
    refute @person.has_bike?
    @person << Bike.new
    assert @person.has_bike?
  end

  def test_person_can_return_a_bike
    bike = Bike.new
    @person << bike
    assert @person.has_bike?
    @person.release_bike bike
    refute @person.has_bike?
  end
end