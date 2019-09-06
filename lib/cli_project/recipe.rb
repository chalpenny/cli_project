puts "Hello from CliProject::Recipe"


module CliProject
  class Recipe 
    attr_accessor :name, :ingredients, :link
    
    @@all = []

    def initialize
      @name = name
    end
  
    def self.all
      @@all << API.list_recipes.collect do |hash| hash[0]
      end
    end

  end
end