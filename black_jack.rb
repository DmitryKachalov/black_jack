require_relative 'user.rb'
require_relative 'deck.rb'
require_relative 'bank.rb'
require_relative 'hand'
require_relative 'rules'
require_relative 'game_bank'

class BlackJack
  include Rules
  attr_accessor :game_bank
  attr_reader :deck, :dealer, :player

  def initialize(name)
    @player = User.new(name)
    @dealer = Dealer.new
    @game_bank = GameBank.new
    @deck = Deck.new
  end

  def clear_round
    @player.clear_round
    @dealer.clear_round
    @deck.generate
  end

  def start
    raise 'Карты уже сданы' unless @player.cards? && @dealer.cards?

    2.times do
      @dealer.take_card(@deck)
      @player.take_card(@deck)
    end
    @game_bank.make_bets(@player, @dealer)
    [{ name: @player.name, cards: @player.cards }]
  end
  # Делаем ставку
  def take_card(decision)
    @dealer.take_card(@deck)
    @player.take_card(@deck) if decision
    [
      { name: @player.name, cards: @player.cards },
      { name: @dealer.name, cards: @dealer.cards }
    ]
  end
  # Победа в текущем раунде
  def winner
    if @player.points <= BLACKJACK && (@dealer.points < @player.points || @dealer.points > BLACKJACK)
      @player.name
    elsif @dealer.points <= BLACKJACK && (@player.points < @dealer.points || @player.points > BLACKJACK)
      DEALER
    else
      ANTE
    end
  end

  def pay_money
    # puts @game_bank.money
    if winner == DEALER
      @game_bank.reward_winner(@dealer)
    elsif winner == @player.name
      @game_bank.reward_winner(@player)
    else
      @game_bank.refund(@player, @dealer)
    end
    clear_round
    { name: @player.name, amount: @player.money }
  end

  def absolute_winner
    if @player.money? && !@dealer.money?
      @player.name
    elsif !@player.money? && @dealer.money?
      DEALER
    end
  end
end