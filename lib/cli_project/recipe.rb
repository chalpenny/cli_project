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
      self.all.index(input)
       # puts "#{index}. #{x.name}:"
       binding.pry
    end

  end
end