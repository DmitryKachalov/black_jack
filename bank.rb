#Определили класс Банк
#Добавили методы get set. по дефолту money = 0

class Bank

  attr_accessor :money

  def initialize
    @money = 0
  end
end
