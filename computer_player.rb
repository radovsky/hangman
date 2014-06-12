class ComputerPlayer
  def initialize
    @already_guessed = []
  end
  
  def pick_secret_word
    @word = File.readlines("./dictionary.txt").map(&:rstrip).sample
  end
  
  def receive_secret_length(s_w)
    @secret_length = s_w
  end
  
  def guess(s_l) #p ("a".."z").to_a.sample
    new_guess = ("a".."z").to_a.sample
    while @already_guessed.include?(new_guess)
      new_guess = ("a".."z").to_a.sample
    end
    @already_guessed << new_guess
    p new_guess
  end
  
  def check_guess(letter)
    (0...@word.size).select { |i| @word[i] == letter }
  end
  
  def handle_guess_response(arr)
    if arr.empty?
      puts "Wrong. Try again"
    else
      puts "Correct"
    end
  end
end
