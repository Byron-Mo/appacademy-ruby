require_relative 'piece'

class SlidingPiece < Piece
  def initialize(pos, color = nil, board = nil)
    super
    @offsets = [0, 1, -1].repeated_permutation(2).to_a - [[0, 0]]
  end

  def moves
    possible_moves = []

    @offsets.each do |offset|
      current_pos = [@pos[0] + offset[0], @pos[1] + offset[1]]
      current_piece = @board[*@pos]
      while in_bounds?(current_pos)
        if @board[*current_pos].color == nil
          possible_moves << current_pos
        elsif !colors_are_same(current_piece, @board[*current_pos])
          possible_moves << current_pos
          break
        elsif colors_are_same(current_piece, @board[*current_pos])
          break
        end
        current_pos = [current_pos[0] + offset[0], current_pos[1] + offset[1]]
      end
    end
    possible_moves
  end


end

class Rook < SlidingPiece
  attr_reader :offsets

  def initialize(pos, color = nil, board = nil)
    super
    @value = :r
    @offsets = @offsets.reject{|x, y| x.abs == y.abs}
  end

end

class Queen < SlidingPiece
  attr_reader :offsets
  def initialize(pos, color = nil, board = nil)
    super
    @value = :q
  end
end

class Bishop < SlidingPiece
  def initialize(pos, color = nil, board = nil)
    super
    @value = :b
    @offsets = @offsets.select{|x, y| x.abs == y.abs}
  end
end
