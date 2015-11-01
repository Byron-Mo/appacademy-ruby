require_relative 'card'
class Board
  attr_reader :board

  def initialize
    @board = Array.new(4){Array.new(4)}
    cards1 = (1..(@board.size * @board[0].size) / 2).to_a.map {|num| Card.new(num)}
    cards2 = (1..(@board.size * @board[0].size) / 2).to_a.map {|num| Card.new(num)}
    @cards = cards1 + cards2
  end

  def populate
    card_names = @cards.shuffle
    # i = 0
    @board.each_with_index do |row, idx1|
      @board.each_with_index do |col, idx2|
        @board[idx1][idx2] = card_names.pop
        # i += 1
      end
    end
  end

  def render
    @board.each do |row|
      display = row.map do |card|
        card.to_s
      end
      p display.join(' ')
    end
  end

  def won?
    # @board.each_with_index do |row|
    #   row.each_with_index do |card|
    #     return false if card.face_down
    #   end
    # end

    return false if @board.flatten.any?{ |card| card.face_down }
    puts "Grats, you won!"
    true
  end

  def reveal(location)
    self[*location].reveal
  end

  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, mark)
    @board[row][col] = mark
  end

end

# board = Board.new
#  p board
#  board.populate
#  board.render
#  puts board.won?
# p board.reveal([0,0])
# board.render
