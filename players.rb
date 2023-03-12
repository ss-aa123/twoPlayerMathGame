class Player
  attr_accessor :name, :lives, :wins

  def initialize(name)
    @name = name
    @lives = 3    # start w/ full 3 lives
    @wins = 0   # start w/ 0 wins
  end

  def increase_wins
    @wins += 1
  end

  def lose_life
    @lives -= 1
  end

  def player_alive
    @lives > 0 ? true : false 
  end

end