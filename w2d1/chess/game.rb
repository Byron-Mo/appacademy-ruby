require_relative "board"
require_relative "player"

require_relative "sliding_piece"
require_relative "stepping_piece"
require_relative "piece"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    begin
      while true
        start_pos = @player.move
        end_pos = @player.move
        @board.move_piece(start_pos, end_pos)
      end
    rescue => e
      puts e
      retry
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  # p game.board[7, 1 ].offsets
  game.run
end
