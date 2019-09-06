puts "Hello from CliProject::Recipe"


module CliProject
  class Recipe 
    attr_accessor :name, :ingredients, :link
    
    @@all = [recipes]

    def initialize
      @name = name
    end
  
  end
end