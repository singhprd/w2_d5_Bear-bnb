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
      guest: nil,
      occupied: false,
      rate: 20,
      num_beds: 1
      }),
      102 => Room.new({
      guest: "Jane",        
      occupied: true,
      rate: 20,
      num_beds: 2
      }),
      103 => Room.new({
      guest: nil,        
      occupied: false,
      rate: 20,
      num_beds: 1
      })
    }

    @hotel = Hotel.new(rooms_hash, 1000, "Balmoral")
    @guest_to_check_in = Guest.new({name: "Bob", money: 500, beds_wanted: 1})
    @guest_to_check_out = Guest.new({name: "Jane", money: 500, beds_wanted: 2})
    @booking = Booking.new
  end

  def test_check_in
    result = @booking.check_in( @guest_to_check_in, @hotel )
    assert_equal("Booked Room", result)

    updated_room_guest = @hotel.rooms_hash[101].guest
    assert_equal("Bob", updated_room_guest)

    updated_room_occupancy = @hotel.rooms_hash[101].occupied
    assert_equal(true, updated_room_occupancy)
  end

  def test_check_out
    result = @booking.check_out( @guest_to_check_out, @hotel, 102 )
    assert_equal("Checked out", result)

    updated_room_guest = @hotel.rooms_hash[102].guest
    assert_equal(nil, updated_room_guest)

    updated_room_occupancy = @hotel.rooms_hash[102].occupied
    assert_equal(false, updated_room_occupancy)    
  end

end