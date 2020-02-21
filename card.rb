# Определили класс Карты
# Метод name возвращает значение и масть
require_relative 'rules'

class Card
  include Rules

  attr_accessor :value, :suit

  def initialize(value, suit)
    message = ''
    raise message unless SUITS.include?(suit)
    message = ''
    raise message unless CARDS.include?(value)
    @value = value
    @suit = suit
  end

  def name
    @value + @suit
  end
end