require_relative 'hotel'
require_relative 'guest'
require_relative 'hotel'

class Booking

  attr_reader(:hotel, :guest)

  def initialize(hotel, guest)
    @hotel = hotel
    @guest = guest
  end

  def hotel_name
    return @hotel.name
  end

  def guest_name
    return @guest.name
  end


end