load 'player.rb'
load 'board.rb'
require 'byebug'

class Game
  attr_reader :board
  def initialize(player)
    @player = player
    @board = Board.new
    @board.place_bombs
    @board.place_numbers
    @board.take_in_tiles
  end

  def play
    @board.display
    until won? || lost?
      coords = @player.request_input
      click = @player.request_click
      if click == :R
        right_click(coords)
      elsif click == :L
        left_click(coords)
      end
      @board.display
    end

    if won?
      puts "grats #{@player.name}! you won"
    elsif lost?
      puts "#{@player.name}, you lose"
    end

    @board.display
  end

  def lost?
    @board.grid.each do |row|
      row.each do |el|
        if el.bomb == true && el.revealed == true
          return true
        end
      end
    end
    return false
  end

  def won?
    @board.grid.each do |row|
      row.each do |el|
        if el.bomb == false && el.revealed == false
          return false
        end
      end
    end
    return true
  end

  def left_click(pos)
    @board[*pos].reveal
    if @board[*pos].bomb == false
      reveal_tile2(pos)
    end
  end

  def right_click(pos)
    @board[*pos].flag_tile
  end

  # BFS
  def reveal_tile2(pos)
    arr = [pos]
    while arr.size >= 1
      if @board[*arr.first].value == 0
        a = @board.surrounding_positions_with_flag(arr.first)
        unless a.empty?
          arr += a
        end
      end
      @board[*arr.shift].reveal
    end
  end

  # def reveal_tile(pos)
  #   pos_arr = @board.surrounding_positions_with_flag(pos)
  #   reveal_positions(pos_arr)
  #   while check_for_zero(pos_arr)
  #     pos_arr = expand_arr(pos_arr)
  #     reveal_positions(pos_arr)
  #   end
  # end
  #
  # def expand_arr(pos_arr)
  #   arr = []
  #   pos_arr.each do |pos|
  #     arr += @board.surrounding_positions_with_flag(pos) if @board[*pos].value == 0
  #   end
  #   arr
  # end
  #
  # def reveal_positions(pos_arr)
  #   pos_arr.each do |pos|
  #     @board[*pos].reveal
  #   end
  # end
  #
  # def check_for_zero(pos_arr)
  #   return false if pos_arr.empty?
  #   pos_arr.each do |pos|
  #     return true if @board[*pos].value == 0
  #   end
  #   return false
  # end


end
