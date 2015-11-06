class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def render
    puts "0: #{towers[0].join(' ')}"
    puts "1: #{towers[1].join(' ')}"
    puts "2: #{towers[2].join(' ')}"
  end

  def move(from_tower, to_tower)
    towers[to_tower] << towers[from_tower].pop
  end

  def won?
    towers[0].empty? && towers[1].empty?
  end



end
