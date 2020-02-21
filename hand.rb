require_relative 'deck'
require_relative 'rules'

class Hand
  include Rules

  attr_accessor :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def take_card(deck)
    raise 'У этого игрока уже есть 3 карты' if @cards.count > MAX_CARDS

    random_card = deck.cards.sample
    @cards << random_card
    deck.cards.delete(random_card)
    score
  end

  def score
    @points = 0
    have_ace = false
    @cards.each do |card|
      if %w[J Q K].include?(card.value)
        @points += FACE_CARD
      elsif card.value == 'A'
        @points += ACE_CARD
        have_ace = true
      else
        @points += card.value.to_i
      end
    end
    @points -= 10 if @points > BLACKJACK && have_ace
  end

  def max_cards?
    @cards.count == MAX_CARDS
  end
end