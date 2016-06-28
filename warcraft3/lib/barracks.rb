class Barracks
  attr_reader :gold, :food, :health_points
  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
  end

  def can_train_footman?
    gold >= 135 && food >= 2
    # true
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def damage(dmg)
    @health_points -= dmg
  end

  def dead?
    @health_points <= 0
  end
  
end
