# frozen_string_literal: true

module Interface
  module_function

  MENU = "
  1. Пропустить ход
  2. Взять карту
  3. Открыть карты"

  def welcome(user)
    puts "Добро пожаловать в игру #{user}!"
  end

  def info(user)
    puts "У Вас: #{user.points} очков, Баланс: #{user.balance}"
  end

  def choise
    puts MENU
    gets.chomp.to_i
  end

  def ask_to_comtinue
    puts 'Хотите продолжить?(да/нет)'
    gets.chomp
  end

  def user_win
    puts 'Поздравляем! Вы выиграли!'
  end

  def user_lose
    puts 'Вы проиграли!'
  end

  def end_game
    puts 'Игра окончена. До свидания.'
  end

  def open_cards
    puts 'Открываем карты!'
  end

  def draw_round
    puts 'Ничья!'
  end
end
