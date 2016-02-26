class Room

  attr_reader(:occupied, :rate, :num_beds, :guest)

  def initialize(input_hash)
    @occupied = input_hash[:occupied]
    @rate = input_hash[:rate]
    @num_beds = input_hash[:num_beds]
    @guest = input_hash[:guest]
  end

  def update_room_occupancy( updated_state )
    @occupied = updated_state  
  end

  def update_room_guest( updated_guest )
    @guest = updated_guest
  end


end