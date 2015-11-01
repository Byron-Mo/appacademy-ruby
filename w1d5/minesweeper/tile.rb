class Tile
  attr_reader :value, :display, :bomb, :flagged, :revealed

  def initialize(state)
    @display = 'X'
    state.class == Symbol ? @bomb = true : @bomb = false
    @value = state
    @flagged = false
    @revealed = false
  end

  def reveal
    @revealed = true
    @bomb == true ? @display = 'B' : @display = @value
  end

  def flag_tile
    if @flagged == true
      @flagged = false
      @display = 'X'
    elsif @flagged == false
      @flagged = true
      @display = 'F'
    end
  end

end
