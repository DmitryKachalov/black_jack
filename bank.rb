#Определили класс Банк
#Добавили методы get set. по дефолту money = 0
require_relative 'rules'

class Bank
  include Rules
  attr_accessor :money

  def initialize(money = 0)
    @money = money
  end
  # Принять ставку кладем деньги в банк игры
  def get_money(money)
    @money += money
  end

  def withdraw(money)
    raise 'Недостаточно средств!' if money > @money
    @money -= money
  end

  def reset_bank
    @money = 0
  end

  def money?
    @money <= 0
  end
end