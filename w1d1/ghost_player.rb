class GhostPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
    #check for valid input
  end

  def alert_invalid_guess
    puts "invalid guess"

  end
end
