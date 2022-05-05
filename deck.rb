# frozen_string_literal: true
class Deck
  attr_reader :deck

  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITE = ['♢', '♣', '♡', '♠'].freeze

  def initialize
    @deck = ganerate_deck
    shuffle_deck
  end

  def ganerate_deck
    @deck = VALUE.product(SUITE)
  end

  def shuffle_deck
    @deck.shuffle!
  end
end
