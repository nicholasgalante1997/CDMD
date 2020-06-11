require 'tty-prompt'
require 'tty-font'
require 'pastel'


require_relative 'challenges_env.rb'




class CommandLineInterface

  def greet
    puts "Welcome To The Game of Games"
  end

  def let_the_games_begin
    font = TTY::Font.new(:doom)
    pastel = Pastel.new

    puts "Alright! That's enough! The Gauntlet has been cast! And as we all know too well, there can be no uncasting of the gauntlet."
    puts "No, no, Alas the time for games has started."
    puts "Within this game, there are TWO teams, and yet-"
    puts "There can be only one in: "
    puts ""
    puts pastel.cyan(font.write("The Game of Games"))
  end


end
