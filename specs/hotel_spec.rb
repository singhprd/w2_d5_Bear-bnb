require 'minitest/autorun'
require 'minitest/rg'
require_relative '../room'
require_relative '../hotel'

class HotelTest < MiniTest::Test

  def setup

    rooms_hash = {
      101 => Room.new({
      :guest => nil,
      :occupied => false,
      :rate => 20,
      :num_beds => 1
      }),

      102 => Room.new({
      :guest => nil,        
      :occupied => false,
      :rate => 20,
      :num_beds => 1
      }),

      103 => Room.new({
      :guest => nil,        
      :occupied => false,
      :rate => 20,
      :num_beds => 2
      })
    }

    @hotel = Hotel.new(rooms_hash, 1000, "Balmoral")
  end

  def test_hotel_has_three_rooms
    result = @hotel.rooms_array.count
    assert_equal(3, result)
  end
  
  def test_hotel_has_an_account
    result = @hotel.account
    assert_equal(1000, result)
  end

  def test_hotel_has_rooms_array
    result = @hotel.rooms_array
    assert_equal([101, 102, 103], result)
  end

  def test_find_room_number
    result = @hotel.rooms_array
  end

  def test_hotel_has_name
    result = @hotel.name
    assert_equal("Balmoral", result)
  end

  def test_find_single_room
    result = @hotel.find_single_room
    assert_equal(101, result)  
  end

  def test_find_double_room
    result = @hotel.find_double_room
    assert_equal(103, result)
  end




end