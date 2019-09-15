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

    def self.new_from_hash(hash) #try .sample(10) or (20)
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

    def self.find_by_ingredient(input)
      recipe = self.all.collect {|recipe| recipe.ingredients}
       recipe.each do |string| 
        string.split(", ").uniq.each do |word| 
        if word == input
          
         # binding.pry
        #puts "#{data.name}"
        #binding.pry
        #puts "Link to recipe: #{recipe.link}"
        #puts "Ingredients: #{recipe.ingredients}"
        end
       end
      end
    end

  end
end