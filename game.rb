# frozen_string_literal: true

require_relative 'interface'
require_relative 'card'
require_relative 'deck'
require_relative 'user'

class Game
  include Interface
  attr_accessor :dealer, :user, :bank, :current_deck, :deck, :points_counter
  attr_reader :take_card, :hand

  RATE = 20
  @@round_num = 0

  def initialize
    @user = new_user
    @dealer = Dealer.new("dealer")
    @bank = 0
    @current_deck = Deck.new
    Interface.welcome(@user.name)
  end

  def new_user
    puts 'Введите имя нового игрока:'
    input = gets.chomp.capitalize
    User.new(input)
  end

  def start_game
    @@round_num += 1
    exit! if @@round_num > 1 && (Interface.ask_to_comtinue == 'нет')
    first_round
    loop do
      case Interface.choise
      when 1
        dealer_move
      when 2
        user_move
        Interface.info(user)
      when 3
        open_cards
        break
      end
      if user.hand.size == 3 && dealer.hand.size == 3
        open_cards
        break
      end
    end
    if user.balance != 0 && dealer.balance != 0
      start_game
    elsif user.balance > dealer.balance
      Interface.user_win
    else
      Interface.user_lose
    end
  end

  def seed
    user.take_card(2, @current_deck)
    dealer.take_card(2, @current_deck)
  end

  private

  def do_rate
    user.balance -= RATE/2
    dealer.balance -= RATE/2
  end

  def first_round
    do_rate
    user.take_card(2, @current_deck)
    dealer.take_card(2, @current_deck)
    user.show_card(user.name)
    Interface.info(user)
    dealer.hide_hand
  end

  def user_move
    user.take_card(1, @current_deck)
    user.show_card(user.name)
    open_cards if user.points_counter >= 21
  end

  def dealer_move
    if dealer.points_counter < 17
      dealer.take_card(1, @current_deck)
    else
      'Пас'
    end
    dealer.hide_hand
  end

  def open_cards
    calculate_round
    dealer.show_card(dealer.name)
    Interface.info(dealer)
    user.clean_hand
    dealer.clean_hand
    
  end

  def calculate_round
    if (user.bust? && dealer.bust?) || (user.points_counter == dealer.points_counter)
      Interface.draw_round
      user.balance += RATE / 2
      dealer.balance += RATE / 2
    elsif (dealer.points_counter > user.points_counter || user.bust?) && dealer.points_counter <= 21
      Interface.user_lose
      dealer.balance += RATE
    elsif (user.points_counter > dealer.points_counter || dealer.bust?) && user.points_counter <= 21
      Interface.user_win
      user.balance += RATE
    end
  end
end
