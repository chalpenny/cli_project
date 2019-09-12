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
      puts "Main ingredients: #{recipe.ingredients}"
        #binding.pry
    end

  end
end