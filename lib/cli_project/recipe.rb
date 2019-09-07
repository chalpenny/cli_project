puts "Hello from CliProject::Recipe"

require "pry"

module CliProject
  class Recipe 
    attr_accessor :name, :ingredients, :link
    
    @@allrecipes = []

    def initialize
      @name = name
      @ingredients = ingredients
      @link = link
    end
  
    def self.all
      @@allrecipes << API.all[0][0]
      #check out 42:00 of Avi's video.  
      binding.pry
    end

  end
end