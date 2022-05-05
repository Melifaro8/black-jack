class User

  attr_accessor :name, :hand, :balance, :points

  def initialize (name)
    @name = name
    @hand = []
    @balance = 100
    @points = []
  end    
end

class Dealer < User

  attr_reader :name, :hand, :balance

  def initialize
    @name = "Dealer"
    @balance = 100
    @hand = []
    @points = []
  end 
end