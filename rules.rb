# frozen_string_literal: true
module Rules
  START_MONEY = 100
  BET = 10
  MAX_CARDS = 3
  BLACKJACK = 21
  FACE_CARD = 10
  ACE_CARD = 11
  SUITS = %w[♥ ♦ ♣ ♠].freeze
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  DEALER = :dealer
  ANTE = :ante
end
