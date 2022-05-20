# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'

class User
  attr_accessor :name, :hand, :balance, :points, :rangs

  def initialize(name)
    @name = name
    @hand = []
    @rangs = []
    @balance = 100
    @points = 0
  end

  def take_card(number, deck)
    number.times do
      @hand << deck.deck.shift
      @rangs << @hand.last.value
      points_counter
    end
  end

  def points_counter
    hand do |_card|
      card do |_suite, value|
        case value
        when 2..10
          self.points += value
        when 'J', 'Q', 'K'
          self.points += 10
        when 'A'
          self.points += if self.points + 11 <= 21
                           11
                         else
                           1
                         end
        end
      end
    end
  end

  def show_card
    puts 'Ваши карты:'
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
    hand.clear
    self.points = 0
  end

  def bust?
    true if self.points > 21
  end
end

class Dealer < User
  attr_reader :name, :hand, :balance

  def initialize(name)
    super
  end
end
