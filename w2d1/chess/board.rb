class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # @pieces = pieces
    populate_board
  end

  def move_piece(start_pos, end_pos)
    if self[*start_pos].color.nil?
      raise ArgumentError, "Cannot move an empty position"
    elsif self[*end_pos].color == self[*start_pos].color
      raise ArgumentError, "Cannot take your own piece"
    elsif self[*start_pos].moves.include?(end_pos) == false
      raise ArgumentError, "Cannot move there"
    end

    switch_position(start_pos, end_pos)
  end

  def switch_position(start_pos, end_pos)
    self[*start_pos].pos = end_pos
    if self[*end_pos].color.nil? # we are moving piece to empty tile
      self[*end_pos].pos = start_pos
      temp = self[*start_pos]
      self[*start_pos] = self[*end_pos]
      self[*end_pos] = temp
    else # we are capturing
      self[*end_pos] = self[*start_pos]
      self[*start_pos] = Piece.new(start_pos)
    end
  end

  def populate_board
    @grid.each.with_index do |row, r_idx|
      row.each.with_index do |col, c_idx|
        position = [r_idx, c_idx]
        if r_idx == 0 && (c_idx == 0 || c_idx == 7)
          self[*position] = Rook.new(position, :black)
        elsif r_idx == 0 && c_idx == 3
          self[*position] = Queen.new(position, :black)
        elsif r_idx == 0 && (c_idx == 2 || c_idx == 5)
          self[*position] = Bishop.new(position, :black)
        elsif r_idx == 0 && (c_idx == 1 || c_idx == 6)
          self[*position] = Knight.new(position, :black)
        elsif r_idx == 0 && c_idx == 4
          self[*position] = King.new(position, :black)
        elsif r_idx == 1
          self[*position] = Piece.new(position, :black)
        elsif r_idx == 6
          self[*position] = Piece.new(position, :white)
        elsif r_idx == 7 && (c_idx == 0 || c_idx == 7)
          self[*position] = Rook.new(position, :white)
        elsif r_idx == 7 && c_idx == 3
          self[*position] = Queen.new(position, :white)
        elsif r_idx == 7 && (c_idx == 2 || c_idx == 5)
          self[*position] = Bishop.new(position, :white)
        elsif r_idx == 7 && (c_idx == 1 || c_idx == 6)
          self[*position] = Knight.new(position, :white)
        elsif r_idx == 7 && c_idx == 4
          self[*position] = King.new(position, :white)
        else
          self[*position] = Piece.new(position)
        end
      end
    end

    @grid.each do |row|
      row.each do |el|
        el.board = self if el.is_a?(Piece)
      end
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, value)
    @grid[row][col] = value
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

end

if __FILE__==$PROGRAM_NAME
  b = Board.new
  p b.grid
  b.move_piece([0,0],[0, 1])
  b.display
end
