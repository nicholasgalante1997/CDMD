require 'tty-prompt'
require 'pry'


require_relative '../lib/cli.rb'
require_relative '../lib/rules_and_instructions.rb'
require_relative '../lib/challenges_env.rb'
require_relative '../lib/chance.rb'
require_relative '../lib/game.rb'


prompt = TTY::Prompt.new

cli = CommandLineInterface.new
rules = RulesAndInstructions.new
level_one_challenges = Challenge.sort_by_level(1)
level_two_challenges = Challenge.sort_by_level(2)
level_three_challenges = Challenge.sort_by_level(3)
chance_cards = Challenge.separate_chance_cards
Challenge.assign_id_to_challenges

#binding.pry #Note to self, you can only use rand on an integer so we're gonna have to assign IDs per card shit
cli.greet
initial_response = prompt.select("Please Select From One of The Following Options:", %w(GameStart GeneralInstructions))
if initial_response == "GeneralInstructions"
second_response = prompt.select("Click on any one of these options for further explanation of gameplay, or reference. If it is your first time playing, we recommend you select 'ALL' to get a better feel for the game, and what is required of you:", %w(GeneralInstructions LevelInstructions CheatingRules Penalties VomitingPolicy DetailsAndMisc LastMinuteRules EndingTheGame ALL_WalkThrough))
  if second_response == "GeneralInstructions"
    rules.general_instructions
  elsif second_response == "LevelInstructions"
    rules.level_instructions
  elsif second_response == "CheatingRules"
    rules.cheating_rules
  elsif second_response == "Penalties"
    rules.penalties
  elsif second_response == "VomitingPolicy"
    rules.vomitting_policy
  elsif second_response == "DetailsAndMisc"
    rules.details_and_miscellaneous
  elsif second_response == "LastMinuteRules"
    rules.last_minute_rules
  elsif second_response == "EndingTheGame"
    rules.ending_the_game
  elsif second_response == "ALL_WalkThrough"
    rules.general_instructions
    puts ""
    rules.level_instructions
    puts ""
    rules.cheating_rules
    puts ""
    rules.penalties
    puts ""
    rules.vomitting_policy
    puts ""
    rules.details_and_miscellaneous
    puts ""
    rules.last_minute_rules
    puts ""
    rules.ending_the_game
    puts ""
  end
elsif initial_response == "GameStart"
  cli.let_the_games_begin
  team_one = Team.new(prompt.ask("Team One, enter your team name."))
  team_two = Team.new(prompt.ask("Team Two, enter your team name."))
  game_ = Game.new(team_one, team_two)
  while team_one.score < 12 || team.two.score < 12 do
  game_.take_turn(team_one)
  game_.take_turn(team_two)
  end
end
