require 'minitest/autorun'
require 'minitest/rg'
require_relative '../Room'

class RoomTest < MiniTest::Test

  def setup
    @test_room = Room.new({
      :guest => nil,
      :occupied => false,
      :rate => 20,
      :num_beds => 1
      })
  end

  def test_room_is_occupied
    result = @test_room.occupied
    assert_equal(false, result)
  end

  def test_room_has_a_rate
    result = @test_room.rate
    assert_equal(20, result)
  end

  def test_room_has_beds
    result = @test_room.num_beds
    assert_equal(1, result)
  end

  def test_update_room_occupancy
    result = @test_room.update_room_occupancy(true)
    assert_equal( true, @test_room.occupied )
  end

  def test_update_room_guest
    resullt = @test_room.update_room_guest( "Bill" )
    assert_equal( "Bill", @test_room.guest )
  end

end