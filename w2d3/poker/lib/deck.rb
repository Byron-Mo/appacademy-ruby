require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = (0...52).to_a.map { |id| Card.new(id) }.shuffle
  end

  def draw
    @deck.pop
  end
end
