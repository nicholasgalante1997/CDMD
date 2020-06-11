require_relative 'challenges.rb'
require_relative 'team.rb'
require_relative 'chance.rb'
require 'tty-prompt'

class Game

  prompt = TTY::Prompt.new

  attr_accessor :team_one, :team_two
  @@all = []

  def initialize(team_one, team_two)
    @team_one = team_one
    @team_two = team_two
    @@all << self
  end

  def self.all
    @@all
  end


  def take_turn(team)
    prompt = TTY::Prompt.new
    if team.score < 5
      card_draw = rand(1..25)
      Challenge.find_by_id(card_draw)
      q = prompt.ask("Did you pass the challenge? [Y/n]")
      if q == "Y" || q == "y" || q == "yes" || q == "Yes"
        team.score_point
        p "Nice"
        p team.score
      else
        "Okay, now the chance to steal"
      end
    elsif team.score >= 5 && team.score < 9
      card_draw = rand(26..61)
      Challenge.find_by_id(card_draw)
      q = prompt.ask("Did you pass the challenge? [Y/n]")
      if q == "Y" || q == "y" || q == "yes" || q == "Yes"
        team.score_point
        p "Nice"
        p team.score
      else
        "Okay, now the chance to steal"
      end
    elsif team.score >= 9
      card_draw = rand(62..95)
      Challenge.find_by_id(card_draw)
      q = prompt.ask("Did you pass the challenge? [Y/n]")
      if q == "Y" || q == "y" || q == "yes" || q == "Yes"
        team.score_point
        p "Nice"
        p team.score
      else
        "Okay, now the chance to steal"
      end
    end
  end


end
