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
    end
  
    def self.all
      @@all << API.all
      #check out 42:00 of Avi's video.  
      binding.pry
    end

    def self.new_from_hash(hash)
      name = hash["title"]
      ingredients = hash["ingredients"]
      link = hash["href"]

      new_recipe = Recipe.new(name, ingredients, link)
    end

  end
end