puts "Hello from CliProject::Recipe"

require "pry"

module CliProject
  class Recipe 
    attr_accessor :name, :ingredients, :link
    
    @@all = []

    def initialize(name, ingredients, link)
      @name = name
      @ingredients = ingredients
      @link = link
      @@all << self
    end
  
    def self.all
      @@all
    end

    def self.new_from_hash(hash)
      name = hash["title"]
      ingredients = hash["ingredients"]
      link = hash["href"]

      new_recipe = Recipe.new(name, ingredients, link)
    end

    def self.find(input)
      recipe = self.all[input.to_i-1]
      puts "#{recipe.name}"
      puts "Link to recipe: #{recipe.link}"
      puts "Ingredients: #{recipe.ingredients}"
    end

    def self.find_by_name(input)
      # recipe = []      
      # recipe = self.all.collect {|recipe| recipe.ingredients}
      # binding.pry
      #  data = []
      #  data = recipe.each do |string| 
      #   if string.split(", ") == input
      # binding.pry
      # #self.all.select |

      recipe = []      
      recipe = self.all.collect {|recipe| recipe.ingredients}
       recipe.each do |string| 
        string.split(", ").uniq.each do |x| 
        if x == input
    
      puts "#{recipe.name}"
      puts "Link to recipe: #{recipe.link}"
      puts "Ingredients: #{recipe.ingredients}"
      end
    end

        #take string that matches index that was called as input OR have input be a string(strip and downcase)
        #take that input and iterate across the ingredients of the recipes, splitting as you do so to check each word
        #possibly lose option 2.  Option 3 has a choice for ingredients to choose from list
      
    end
    end

  end
end