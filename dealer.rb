class Dealer < User

  def take_card(deck)
    super if points < 17
  end
end