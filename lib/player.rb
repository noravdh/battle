class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points, :character, :moves

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @moves = {
      "crash bandicoot"=> {"Spin"=> [11, 1, 2, 2], "Slide"=> [7, 3, 7, 6, 4, 1, 11] },
      "spyro"=> {"Headbutt"=> [8, 3, 3, 2], "Fire"=> [7, 5, 7, 10, 4, 8, 11] }
    }
  end

  def choose_character(character)
    @character= character
  end

  def receive_damage(attacking_character, move)
    @hit_points -= @moves[attacking_character][move].sample
  end
end