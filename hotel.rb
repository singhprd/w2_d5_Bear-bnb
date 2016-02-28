class Hotel

  attr_reader(:rooms_hash, :account, :name)

  def initialize(rooms_hash, account, name)
    @rooms_hash = rooms_hash
    @account = account
    @name = name
  end

  def rooms_array()
    rooms_array = Array.new
      for key, value in @rooms_hash
        rooms_array << key
      end
    return rooms_array
  end 

  def find_single_free_room
    for key, value in rooms_hash
      if value.num_beds == 1 && value.occupied == false
        return key
      end
    end
    return false
  end

  def find_double_free_room
    for key, value in rooms_hash
      if value.num_beds == 2
        return key
      end
    end
    return false
  end

  def occupied_rooms
    occupied_rooms_array = []
    for key, value in @rooms_hash
      if value.occupied == true
        occupied_rooms_array << key
      end
    end
      return occupied_rooms_array
  end


  def unoccupied_rooms
     unoccupied_rooms_array = []
    for key, value in @rooms_hash
      if value.occupied == false
        unoccupied_rooms_array << key
      end
    end
      return unoccupied_rooms_array   
  end

  def return_guest( room_number )
    for key, value in @rooms_hash
      if key == room_number
        return value.guest
      end
    end
  end

  def add_to_account( amount )
    return @account += amount
  end

  def bill_all_occupied_rooms
    total_bill = 0
    for key, value in @rooms_hash
      if value.occupied == true
        total_bill += value.rate
      end
    end
    add_to_account(total_bill)
  end

end