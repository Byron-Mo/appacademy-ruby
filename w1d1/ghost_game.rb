load 'ghost_player.rb'

class GhostGame
  attr_reader :dictionary, :current_player, :fragment

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @fragment = ''
    @dictionary = File.readlines('ghost-dictionary.txt').map(&:chomp)

    @current_player = @player1
  end

  def play_round
    while !@dictionary.include?(@fragment)
      take_turn
      next_player!
    end
    
    puts "#{@current_player.name} wins"
  end

  def next_player!
    if @current_player == @player1
      @current_player = @player2
    elsif @current_player == @player2
      @current_player = @player1
    end
  end

  def take_turn
    puts "#{@current_player.name}'s turn:"
    letter = @current_player.guess
    if valid_play?(letter)
      @fragment << letter
    else
      @current_player.alert_invalid_guess
      take_turn
    end
    @dictionary.select! { |word| word.start_with?(fragment)}

  end


  def valid_play?(letter)
    array = ("a".."z").to_a
    return false unless array.include?(letter)

    @dictionary.each { |word| return true if word.start_with?(@fragment + letter)}
    return false
  end


end

player1 = GhostPlayer.new("Byron")
player2 = GhostPlayer.new("Chris")
game = GhostGame.new(player1, player2)
game.play_round
