class HumanPlayer  
  def pick_secret_word
    puts "Enter the length of your word"
    @secret_word = gets.chomp.to_i
  end

  def receive_secret_length(s_w)
    @secret_length = s_w.length
  end

  def guess(s_l)
    letter = gets.chomp
  end

  def check_guess(letter)
    #puts the letter, user enters indices of matches
    #@index = gets.chomp
    res= []
    input = gets.chomp
    while input != ""
      res << input.to_i
      input = gets.chomp
    end
    p res
    res
  end
  
  def handle_guess_response(arr)
    if arr.empty?
      puts "Wrong. Try again"
    else
      puts "Correct"
    end
  end
end