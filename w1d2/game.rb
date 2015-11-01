require_relative 'board'
require_relative 'card'
require_relative 'player'
require_relative 'computer'

class Game

  def initialize(player)
    @player = player
    @board = Board.new
    @board.populate
  end

  def make_guess
    puts "#{@player.name}, make a guess"
    guess = @player.get_guess(@board)
    if @board[*guess].face_down == false #|| guess[0] >= @board.board.size || guess[1] >= @board.board[0].size
      puts "incorrect guess, try again"
      make_guess
    end
    guess
    # while @board[*guess].face_down == false
    #   puts "try again"
    #   guess = @player.get_guess
    #   guess = guess.scan(/\d/).map(&:to_i)
    # end

  end

  def check_cards(card1,card2)
    if card1.face_value != card2.face_value
      card1.hide
      card2.hide
      puts 'nope, try again'
    end
  end

  def play
    count = 1
    until @board.won?
      #system("clear")
      @board.render
      guesses = []
      2.times do
        guess = make_guess
        guesses << @board[*guess]
        @board.reveal(guess)
        @board.render
        puts "turn #{count}"
        puts
      end
      check_cards(guesses[0], guesses[1])
      #sleep(3)
      count += 1
    end
    puts count
  end


end
#name = Player.new
name = Computer.new
game = Game.new(name)
game.play
