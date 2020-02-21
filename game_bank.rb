require_relative 'rules'

class GameBank < Bank
  include Rules

  def make_bets(*users)
    users.each do |user|
      user.withdraw(BET)
      get_money(BET)
    end
  end

  def reward_winner(winner)
    winner.get_money(@money)
    reset_bank
  end

  def refund(*users)
    refund_amount = @money / users.size
    users.each do |user|
      user.get_money(refund_amount)
      withdraw(refund_amount)
    end
  end
end