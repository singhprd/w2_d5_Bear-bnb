require_relative 'hotel'
require_relative 'guest'
require_relative 'hotel'

class Booking

  attr_reader()

  def initialize( )
 
  end

  def check_in( guest, hotel )
    if guest.beds_wanted == 1
      check_in_room = hotel.find_single_room
    elsif guest.beds_wanted == 2
      check_in_room = hotel.find_double_room
    end

    # no rooms
    if check_in_room == false 
      return "Cant find room."
    end

    # Make Booking
    hotel.rooms_hash[check_in_room].update_room_occupancy(true)
    hotel.rooms_hash[check_in_room].update_room_guest(guest.name)
    return "Booked Room"

  end

  def check_out( guest, hotel, room_number )
    if guest.name == hotel.rooms_hash[102].guest

    hotel.rooms_hash[room_number].update_room_occupancy(false)
    hotel.rooms_hash[room_number].update_room_guest(nil)
      return "Checked out"
    else [guest.name, hotel.rooms_hash[102].guest]
    end

  end
# input_hash[some_key] # => value for that key
# input_hash.key(some_value) # => key for that value
end