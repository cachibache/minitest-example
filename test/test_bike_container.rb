require './lib/bike_container'
require './lib/bike'
require './lib/station'
require './lib/van'
require './lib/garage' # the class under test
require 'minitest/autorun' # the minitest itself
require 'ansi' # makes it colored
require 'turn' # improves the default output

class TestBikeContainer < MiniTest::Unit::TestCase

  def setup
    @bike_container = BikeContainer.new
  end

  def test_location_empty?
    assert @bike_container.empty?
  end

  def test_location_can_receive_a_bike
    assert @bike_container.empty?
    @bike_container << Bike.new
    refute @bike_container.empty?
  end

  def test_location_can_release_a_bike    
    10.times { @bike_container << Bike.new }
    refute @bike_container.empty?
    bike = @bike_container.bikes[3]
    released_bike = @bike_container.release_bike bike
    assert_equal released_bike, bike
    assert_equal 9, @bike_container.bikes.count
  end

  def test_location_cannot_release_a_bike_it_does_not_have
    10.times { @bike_container << Bike.new }
    refute @bike_container.empty?
    bike = Bike.new
    assert_raises( RuntimeError ) { @bike_container.release_bike bike }
  end

  def test_location_can_release_specific_bike
    assert @bike_container.empty?
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    @bike_container << bike1
    @bike_container << bike2
    @bike_container << bike3
    refute @bike_container.empty?
    @bike_container.release_bike bike2
    refute @bike_container.include? bike2
  end


end