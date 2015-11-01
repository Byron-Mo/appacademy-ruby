require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return !(@board.winner == evaluator)
    end
    children.each do |child|
      return true if child.losing_node?(evaluator)
    end
    false
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end

    children.each do |child|
      return true if child.winning_node?(evaluator)
    end
    false
  end

  def other_player
    return @next_mover_mark == :x ? :o : :x
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if @board.empty?([i,j])
          board = @board.dup
          board.rows[i][j] = @next_mover_mark
          children_arr << TicTacToeNode.new(board, other_player,[i,j])
        end
      end
    end
    children_arr
  end
end

board = Board.new
mark = :x
node = TicTacToeNode.new(board, mark)

p node.children.length
