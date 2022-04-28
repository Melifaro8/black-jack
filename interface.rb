class Interface

  attr_reader :gamer 

  def start
    puts "Введите имя нового игрока:"
    input = gets.chomp
    gamer = User.new(input)
    dealer = Dealer.new
  end

  def menu
    loop do
    puts "1. Пропустить"
    puts "2. Взять карту"
    puts "3. Открыть карты"
    puts "0. Завершить игру"
    input = gets.chomp.to_i
    break if input.zero?

    case input
    when 1
      dealer_move
    when 2
      take_card
    when 3
      open_cards
    end
  end

end