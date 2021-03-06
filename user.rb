# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'

class User
  attr_accessor :balance, :hand
  attr_reader :name, :rangs

  def initialize(name)
    @name = name
    @hand = []
    @balance = 100
  end

  def take_card(number, deck)
    number.times do
      @hand << deck.deck.shift
    end
  end

  def points_counter
    points = 0
     hand.each do |card|
      case card.value
      when 2..10
        points += card.value
      when 'J', 'Q', 'K'
        points += 10
      when 'A'
        points += if points + 11 <= 21
                    11
                  else
                    1
                  end
      end
    end
    points
  end


  def show_card(name)
    puts "Карты #{name}:"
    @hand.each do |card|
      puts "#{card.suite}, #{card.value}, "
    end
  end

  def hide_hand
    puts 'Карты дилера:'
    hand.size.times do
      print '*'
    end
  end

  def clean_hand
    self.hand = []
  end

  def bust?
    true if self.points_counter > 21
  end
end

class Dealer < User
  attr_reader :name, :hand, :balance

  def initialize(name)
    super
  end
end
