# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :deck

  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITE = ['♢', '♣', '♡', '♠'].freeze

  def initialize
    @deck = []
    generate_deck
    shuffle_deck
  end

  def generate_deck
    SUITE.each do |suite|
      VALUE.each do |value|
        @deck << Card.new(suite, value)
      end
    end
  end

  def shuffle_deck
    @deck.shuffle!
  end
end
