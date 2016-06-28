class Unit
  attr_reader :health_points, :attack_power

  def initialize (hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(ap)
    @health_points -= ap
  end

  def attack!(enemy)
    return nil if dead? or enemy.dead?
    if enemy.class == Barracks
      enemy.damage((@attack_power/2).ceil)
    else
      enemy.damage(@attack_power)
    end

  end

  def dead?
    @health_points <= 0
  end

end