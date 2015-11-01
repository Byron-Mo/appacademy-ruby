class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def request_click
    puts "R or L"
    input = gets.chomp
    input.upcase.to_sym
  end

  def request_input
    puts "enter coords"
    input = gets.chomp
    input.scan(/\d/).map(&:to_i)
  end
end
