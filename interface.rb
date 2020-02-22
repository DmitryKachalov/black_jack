require_relative 'black_jack.rb'
require_relative 'rules'

class Interface
  include Rules

  def introduction
    print "Введите имя: "
    gets.chomp
  end

  def show_money(player)
    puts "#{player[:name]}, у вас #{player[:amount]} фишек"
  end

  def show_cards(players)
    players.each do |player|
      cards = player[:cards].map(&:name)
      message = player[:name].empty? ? 'Карты крупье:' : "Ваши карты, #{player[:name]}:"
      puts "#{message} #{cards.join(', ')}"
    end
  end

  def take_card?
    puts 'Берем карту?([Д]а\[Y]es\[н]ет\[n]o)'
    answer = gets.chomp
    return true if answer == '' || answer.match?(/[дy]|да|yes/i)
    false
  end

  def show_winner(winner)
    case winner
    when DEALER then puts 'В этот раз победили не вы'
    when ANTE then puts 'Ничья'
    else puts "#{winner}, поздравляю вы победили в этом раунде"
    end
  end

  def continue?(winner)
    if winner
      puts 'Продолжаем игру? ([Д]а\[Y]es\[н]ет\[n]o)'
      answer = gets.chomp
      return true if answer == '' || answer.match?(/[дy]|да|yes/i)
    end
    false
  end

  def show_absolute_winner(winner)
    if winner == DEALER
      puts 'Вы проиграли игра закончена'
    else
      puts "Вы выиграли #{winner.name} игра закончена"
    end
  end
end