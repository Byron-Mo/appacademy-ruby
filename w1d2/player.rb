class Player
  attr_reader :name
  def initialize
    #@name = name
    puts "name? : "
    @name = gets.chomp.to_s
  end

  def get_guess(board)
    gets.chomp.to_s.scan(/\d/).map(&:to_i)
  end
end
