require 'minitest/autorun'
require 'minitest/rg'
require_relative '../booking'
require_relative '../room'
require_relative '../guest'
require_relative '../hotel'

class BookingTest < MiniTest::Test

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
      :num_beds => 1
      })
    }

    hotel = Hotel.new(rooms_hash, 1000, "Balmoral")
    guest = Guest.new({name: "Brian", money: 500, beds_wanted: 1})
    @test_booking = Booking.new( hotel, guest )
  end

  def test_booking_has_a_hotel_name
    result = @test_booking.hotel_name
    assert_equal("Balmoral", result)
  end

  def test_booking_has_a_guest_name
    result = @test_booking.guest_name
    assert_equal( "Brian", result )
  end
  
end