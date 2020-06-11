class Player

  attr_accessor :name
  attr_reader :team
  @@all = []

  def initialize(arg)
    @name = arg[:name]
    @team = arg[:team]
    @@all << self
  end

  def self.all
    @@all
  end 

end
