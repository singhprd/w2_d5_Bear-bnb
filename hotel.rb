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

  def find_single_room
    for key, value in rooms_hash
      if value.num_beds == 1
        return key
      end
    end
    return "No Single Rooms Found"
  end

  def find_double_room
    for key, value in rooms_hash
      if value.num_beds == 2
        return key
      end
    end
    return "No Double Rooms Found"
  end



end