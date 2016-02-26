class Room

  attr_reader(:occupied, :rate, :num_beds, :guest)

  def initialize(input_hash)
    @occupied = input_hash[:occupied]
    @rate = input_hash[:rate]
    @num_beds = input_hash[:num_beds]
    @guest = :guest
  end

end