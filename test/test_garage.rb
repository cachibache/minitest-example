require './lib/location'
require './lib/bike'
require './lib/garage' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestGarage < MiniTest::Unit::TestCase

  def setup
    @garage = Garage.new
  end

  def test_garage_empty?
    assert @garage.empty?
  end

  def test_garage_can_receive_a_bike
    assert @garage.empty?
    @garage << Bike.new
    refute @garage.empty?
  end

  def test_garage_can_release_a_bike    
    10.times { @garage << Bike.new }
    refute @garage.empty?
    bike = @garage.bikes[3]
    released_bike = @garage.release_bike bike
    assert_equal released_bike, bike
    assert_equal 9, @garage.bikes.count
  end

  def test_garage_can_release_specific_bike
    assert @garage.empty?
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    @garage << bike1
    @garage << bike2
    @garage << bike3
    refute @garage.empty?
    @garage.release_bike bike3
    refute @garage.include? bike3
  end

  def test_garage_cannot_release_a_bike_it_does_not_have
    10.times { @garage << Bike.new }
    refute @garage.empty?
    bike = Bike.new
    assert_raises( RuntimeError ) { @garage.release_bike bike }
  end
end