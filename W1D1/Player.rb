class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess(curr_frag)
    puts "Current fragment: #{curr_frag}"
    puts "#{@name}, please input a letter: "
    gets.chomp.downcase
  end

  def alert_invalid_guess
    puts "That was an invalid guess, try again"
  end

end
