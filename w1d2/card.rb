class Card
  attr_reader :face_value, :face_down

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def hide
    @face_down = true
    #{}"X"
  end

  def reveal
    @face_down = false
    @face_value
  end

  def to_s
    @face_down ? "X" : @face_value
  end

  def ==(new_card)
    face_value == new_card.face_value
  end

end
