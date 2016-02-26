class Guest

  attr_reader(:name, :money, :beds_wanted)

  def initialize( input_hash )
    @name = input_hash[:name]
    @money = input_hash[:money]
    @beds_wanted = input_hash[:beds_wanted]
  end


end