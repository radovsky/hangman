require './human_player'
require './computer_player'

class Hangman
  def initialize(guessing_player=HumanPlayer.new, checking_player=ComputerPlayer.new)
    @guessing_player, @checking_player = guessing_player, checking_player
    self.play
  end
  
  def play
    @secret_length =
    @guessing_player.receive_secret_length(@checking_player.pick_secret_word)
    @render = "_" * @secret_length
    remaining_turns = 10
    while @render.include?("_") && remaining_turns > 0
      unless turn
        remaining_turns -= 1
      end
      puts "#{remaining_turns} turns left."
      puts
    end
    if @render.include?("_")
      puts "DEAD"
    else
      puts "You won!"
    end
  end
  
  def turn
    puts @render
    guess = @guessing_player.guess(@secret_length)
    indices = @checking_player.check_guess(guess)
    message = @guessing_player.handle_guess_response(indices)
    unless indices.empty?
      indices.each do |i|
        @render[i] = guess
      end
    end
    !indices.empty?
  end

end
  

#g = Hangman.new(HumanPlayer.new, ComputerPlayer.new)
#g = Hangman.new(ComputerPlayer.new, HumanPlayer.new)