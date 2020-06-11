

class Challenge

  attr_reader :level, :category, :prompt, :solution, :title
  attr_accessor :id

  @@all = []
  def initialize(arg)
    @title = arg[:title]
    @level = arg[:level]
    @category = arg[:category]
    @prompt = arg[:prompt]
    @solution = arg[:solution]
    @id = arg[:id]
    @@all << self
  end

  def self.all
    @@all
  end


  def self.sort_by_level(level_integer)
    Challenge.all.select do |challenge|
      challenge.level == level_integer
    end
  end

  def self.sort_by_category(category)
    Challenge.all.select do |challenge|
      challenge.category.downcase == category.downcase
    end
  end

  def self.sort_by_title(title)
    Challenge.all.select do |challenge|
      challenge.title == title
    end
  end

  def self.separate_chance_cards
    Challenge.all.select do |challenge|
      challenge.title == "Chance"
    end
  end

 def self.assign_id_to_challenges
   @count = 1
   Challenge.all.each do |challenge|
     challenge.id = @count
     @count += 1
    end
   end

   def title_and_prompt
     p "#{self.title}"
     p "#{self.category}"
     p "#{self.prompt}"
   end

   def self.find_by_id(id)
     Challenge.all.find do |challenge|
       challenge.id == id
     end.title_and_prompt
   end


end
