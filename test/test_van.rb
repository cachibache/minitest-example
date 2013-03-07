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
    bike = Bike.new
    @van << bike
    refute @van.empty?
    @van.release_bike bike
    assert @van.empty?
  end

  def test_van_can_release_specific_bike
    assert @van.empty?
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    @van << bike1
    @van << bike2
    @van << bike3
    refute @van.empty?
    @van.release_bike bike2
    assert @van.bike2_not_in_van?
  end
end