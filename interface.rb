# viewer gives a console interface to check into a hotel. A new Guest is made based on input information.

require_relative 'booking'
require_relative 'room'
require_relative 'guest'
require_relative 'hotel'

class Interface

  def initialize( )
    rooms_hash_balmoral = {
      101 => Room.new({
      guest: "Peter",
      occupied: true,
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

    @hotel_array = [scotsman_hotel, balmoral_hotel]
  end

  def start
    puts "Welcome to BearBnB"
    user_action = nil
    until user_action == "exit"
      system "clear"
      user_action = ask_user()
      case user_action

        when "check_in"
          hotel_picked = select_hotel
          puts "You selected the #{hotel_picked.name}"
          new_guest = new_guest_interface
          puts new_guest.name
          booking1 = Booking.new
          puts booking1.check_in( new_guest, hotel_picked )
          gets.chomp

        when "check_out"
          hotel_picked = select_hotel
            if hotel_picked.occupied_rooms.size == 0
              puts "All Rooms Already Checked Out"
            else
            room_picked = select_occupied_room(hotel_picked)
            booking2 = Booking.new
            puts booking2.check_out( hotel_picked, room_picked)
          end
        gets.chomp       

        when "hotel_info"
          hotel_picked = select_hotel
          puts hotel_picked.name
          puts "Account: #{hotel_picked.account}"
          puts "Occupied Rooms: #{hotel_picked.occupied_rooms}"         
          puts "Unoccupied Rooms: #{hotel_picked.unoccupied_rooms}"
          gets.chomp

        when "end_day"
          puts "Hotel Accounts:"
          for each in @hotel_array
            each.bill_all_occupied_rooms
            puts "#{each.name}: #{each.account}"
          end
        gets.chomp

        when "exit"
      end
    end
    system "clear"
    puts "Thanks for Picking BearBnB."
    puts "Goodbye"
  end

  def ask_user()    

    selection_hash = {
      "1" => "check_in",
      "2" => 'check_out',
      "3" => "hotel_info",
      "4" => "end_day",
      "5" => "exit"
    }
    puts "What would you like to do?"
    puts "1 :Check in"
    puts "2 :Check Out"
    puts "3 :See Hotel Accounts and Info"
    puts "4 :End Day and Bill All Rooms"
    puts "5 :Exit"
    print "> "

    input = gets.chomp.downcase
      until selection_hash.include?(input)
        puts "Sorry, not recognised! Try again:"
        print "> "
        input = gets.chomp.downcase
      end
    return selection_hash[input]
  end

  def new_guest_interface
    new_guest_hash = {
      name: "",
      money: 0,
      beds_wanted: 0
    }

    print "Name > "
    new_guest_hash[:name] = gets.chomp
    print "Money > "    
    new_guest_hash[:money] = gets.chomp.to_i
    print "Beds Wanted > "    
    new_guest_hash[:beds_wanted] = gets.chomp.to_i

    new_guest = Guest.new(new_guest_hash)
    return new_guest
  end

  def select_hotel
    counter = -1
    puts "Select Hotel"
    for each in @hotel_array
      puts "#{counter += 1}: #{each.name}"
    end
    user_input = gets.chomp.to_i
    return @hotel_array[user_input]
  end

  def select_occupied_room(hotel)
    rooms_array = []
    counter = -1
    puts "Select Room:"
    for each in hotel.occupied_rooms
      puts "#{counter += 1}: #{each} #{hotel.return_guest(each)}"
      rooms_array << each
    end
    user_input = gets.chomp.to_i
    selection = rooms_array[user_input]
    return selection
  end

end

interface = Interface.new()
interface.start