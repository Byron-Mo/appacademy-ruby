class Piece
  attr_reader :color
  attr_accessor :value, :pos, :board

  def initialize(pos, color = nil, board = nil)
    @board = board
    @pos = pos
    @value = color.nil? ? ' ' : :p
    @color = color
  end

  def to_s
    @value.to_s
  end

  private
  def colors_are_same(current_piece, check_piece)
    current_piece.color == check_piece.color
  end

  def in_bounds?(current_pos)
    current_pos[0].between?(0, 7) && current_pos[1].between?(0, 7)
  end
end
