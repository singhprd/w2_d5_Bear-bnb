# require 'colorize'
# require_relative 'bear'
# require_relative 'rest'
# require_relative 'gather'
# require_relative 'hunt'
# require_relative 'logger'
# require_relative 'viewer'

class Interface 

  def initialize(hotel_array = 1)
    @hotel_array = hotel_array
  end

  def start()
    system "clear"
    puts "Welcome to Bear bnb!"
    play_turn()
    # could add another bit in here about telling the user final difficulty?
    puts "Goodbye"
  end

  def play_turn(prev = nil)
    # this commented conditional stops bear from dying when resting
    return unless @day_finish == true
    user_action = ask_user()
    action = user_action.new(@bear, @difficulty)
    action.do()
    @log.commit()
    # diff_hash = calculate_difference()
    system "clear"
    @viewer.display_bear_state()
    # output_bear_pretty(diff_hash) 
    play_turn(action)
    return
  end


  def ask_user()
    choices = {
      "1" => check_in_interface,
      "2" => check_out_interface,
      "3" => hotel_accounts_interface,
      "4" => end_day_interface,
      "5" => exit_interface
    }

    puts "What do you want to do today?"
    
    print "> "
    input = gets.chomp.downcase
      until choices.include?(input)
        puts "Sorry, not recognised! Try again:"
        print "> "
        input = gets.chomp.downcase
      end
    return choices[input]
  end

end

bear = Bear.new(25)
game = Game.new(bear)

game.start()