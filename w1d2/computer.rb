#require_relative 'board'
#require_relative 'game'

class Computer

attr_reader :name, :board

  def initialize
    @name = "Thrall"
    @known_values = {}
    @priority = nil
    @current_turn = 1
  end

  def switch_guess
    @current_turn == 1 ? @current_turn = 2 : @current_turn = 1
  end

  def get_guess(board)
    pairs = smart_guesses

    if @priority.nil? == false
      coords = @priority
      @priority = nil
      @known_values.delete(coords)
    elsif pairs.empty? == false
      coords = @known_values.key(pairs[0])
      @known_values.delete(coords)
      @priority = @known_values.key(pairs[0])
    else
      coords = [(rand(board.board.size)), (rand(board.board[0].size))]
      while @known_values.keys.include?(coords) || board[*coords].face_down == false
        coords = [(rand(board.board.size)), (rand(board.board[0].size))]
      end

      if @known_values.values.include?(board[*coords].face_value) && @current_turn == 1
        #check known_values to see if it contains the same face value as coords && @current == 1
        @priority = @known_values.key(board[*coords].face_value)
        #set priority to the coordinates from known values
      else
        @known_values[coords] = board[*coords].face_value
      end
    end
    switch_guess
    coords

  end

  def smart_guesses
    known_values_array = @known_values.values
    unique_array = known_values_array.uniq
    pairs = []
    unique_array.each do |num|
      pairs << num if known_values_array.count(num) == 2
    end
    pairs
  end

end
