class SiegeEngine < Unit
  LUMBER = 60
  FOOD = 3

  attr_reader :cost

  def initialize
    super(400, 50)
    @cost = {lumber: LUMBER, food: FOOD}
  end

  def attack!(enemy)
    if enemy.class == Barracks
      enemy.damage(@attack_power*2)
    elsif enemy.class == SiegeEngine
      enemy.damage(@attack_power)
    else
      nil
    end
  end

end