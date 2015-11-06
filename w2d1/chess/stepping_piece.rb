require_relative 'piece'

class SteppingPiece < Piece

  def initialize(pos, color = nil, board = nil)
    super
  end

  def moves
    moves = []
    @offsets.each do |offset|
      current_pos = [@pos[0] + offset[0], @pos[1] + offset[1]]
      current_piece = @board[*@pos]
      while in_bounds?(current_pos)
        unless colors_are_same(current_piece, @board[*current_pos])
          moves << current_pos
        end
      end
    end
    moves
  end

end

class Knight < SteppingPiece
  attr_reader :offsets
  def initialize(pos, color = nil, board = nil)
    super
    @value = :k
    @offsets = [[-2, -1], [-2, 1], [2, -1], [2, 1], [-1, 2], [1, 2], [-1, -2], [1, -2]]
  end
end

class King < SteppingPiece
  def initialize(pos, color = nil, board = nil)
    super
    @value = :K
    @offsets = [0, 1, -1].repeated_permutation(2).to_a - [[0, 0]]
  end
end
