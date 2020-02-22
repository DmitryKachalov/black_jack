require_relative 'black_jack'
require_relative 'interface'
require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'hand'
require_relative 'user'
require_relative 'bank'

class Main

  def initialize(interface)
    @interface = interface
  end

  def start
    @blackjack = BlackJack.new(@interface.introduction)
    play
  end

  def play
    cards = @blackjack.start
    @interface.show_cards(cards)
    cards = @blackjack.take_card(@interface.take_card?)
    @interface.show_cards(cards)
    @interface.show_winner(@blackjack.winner)
    @interface.show_money(@blackjack.pay_money)
    @absolute_winner = @blackjack.absolute_winner
    if @interface.continue?(!@absolute_winner)
      play
    else
      finish
    end
  end

  def finish
    @interface.show_absolute_winner(@absolute_winner)
  end
end
Main.new(Interface.new).start