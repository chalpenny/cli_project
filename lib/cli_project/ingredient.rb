puts "Hello from CliProject::Ingredient"


module CliProject
  class Ingredient 
    attr_accessor :name, :recipe
    
    @@all = []

    def initialize
      @name = name
    end
  
    def self.all
      @@all
    end

  end
end