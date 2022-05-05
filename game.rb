# frozen_string_literal: true

require_relative 'deck'
require_relative 'user'
# require_relative 'interface'

class Game
  attr_accessor :dealer, :user, :bank, :current_deck, :deck

  RATE = 20
  @@rounds = 0

  def initialize
    @user = new_user
    @dealer = Dealer.new
    @bank = 0
    @current_deck = Deck.new
    welcome
    start_game
  end

  def new_user
    puts 'Введите имя нового игрока:'
    input = gets.chomp.capitalize
    User.new(input)
  end

  def start_game
    @user.hand = @current_deck.deck.shift(2)
    @dealer.hand = @current_deck.deck.shift(2)
    @bank = 40
    @user.balance = 100 - RATE
    @dealer.balance = 100 - RATE
    round_menu
  end

  def round_menu
    puts "Ваши карты: #{user.hand}"
    puts '1. Пропустить'
    puts '2. Взять карту'
    puts '3. Открыть карты'
    input = gets.chomp.to_i

    case input
      when 1
        dealer_move
      when 2
        take_card
      when 3
        open_cards
    end
  end

  def take_card
    @user.hand << @current_deck.deck.slice!(0)
  end

  def dealer_move
  end

  def open_cards
  
  end

  def welcome
    puts "Добро пожаловать в игру #{@user.name}!"
  end
end
