require_relative 'hand'
require_relative 'bank'
require_relative 'rules'

class User
  include Rules
  attr_accessor :name, :bank

  def initialize(name = '')
    @hand = Hand.new
    @bank = Bank.new(START_MONEY)
    @name = name
  end

  def clear_round
    @hand.cards.clear
    @hand.points = 0
  end

  def cards?
    @hand.cards.empty?
  end

  def cards
    @hand.cards
  end

  def take_card(deck)
    @hand.take_card(deck)
  end

  def points
    @hand.points
  end

  def money
    @bank.money
  end

  def money?
    @bank.money?
  end

  # Кошелек юзера достаем из него деньги
  def bet
    @bank.make_bets(@player, @dealer)
  end

  def withdraw(money)
    @bank.money -= money
  end
  #  Кладем деньги в кошеле юзера
  def get_money(money)
    @bank.get_money(money)
  end
end