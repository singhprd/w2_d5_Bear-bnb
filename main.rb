require_relative 'booking'
require_relative 'room'
require_relative 'guest'
require_relative 'hotel'
require_relative 'interface'

# data
    rooms_hash_balmoral = {
      101 => Room.new({
      guest: nil,
      occupied: false,
      rate: 20,
      num_beds: 1
      }),
      102 => Room.new({
      guest: "nil",        
      occupied: false,
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

    balmoral_hotel = Hotel.new(rooms_hash_balmoral, 1000, "Balmoral")

      rooms_hash_scotsman = {
      101 => Room.new({
      guest: nil,
      occupied: false,
      rate: 20,
      num_beds: 1
      }),
      102 => Room.new({
      guest: "nil",        
      occupied: false,
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

    scotsman_hotel = Hotel.new(rooms_hash_scotsman, 1000, "Scotsman")

    hotel_array = [scotsman_hotel, balmoral_hotel]
# data end

interface = Interface.new(hotel_array)
interface.start

