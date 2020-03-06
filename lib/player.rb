class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points, :character

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @moves = {
      "volvo"=> {"hit"=> [30], "kick"=> [7,3,7,6,4,1,11] },
      "saab"=> {"hit"=> [5], "kick"=> [7,3,7,6,4,1,11] }
    }
  end

  def choose_character(character)
    @character= character
  end

  def receive_damage(attacking_character, move = "kick")
    @hit_points -= @moves[attacking_character][move].sample
  end
end