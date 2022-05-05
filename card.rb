# frozen_string_literal: true

class Card
  attr_reader :suite, :value

  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def output
    "#{value} - #{suite}"
  end
end
