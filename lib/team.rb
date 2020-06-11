require_relative "player.rb"
class Team

  attr_accessor :team_name, :score
  @@all = []

  def initialize(team_name)
    @team_name = team_name
    @score = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def players
    Player.all.each do |player|
      if player.team == self
        puts player.name
      else
      end
    end
  end

  def score_point
    self.score += 1
  end

  def score_check
    if self.score == 9
      puts "Congratulations, you've entered Level Three"
    elsif self.score == 5
      puts "Congratulations, you've moved on to Level Two"
    end
  end


end
