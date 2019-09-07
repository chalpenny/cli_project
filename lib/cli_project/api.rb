puts "Hello from CliProject::API"

require "open-uri"
require "json"
require "pry"

module CliProject
  class API 
    #attr_accessor :name
    
    
    def list_recipes
      data = open("http://www.recipepuppy.com/api/").read
      result = JSON.parse(data)
      @recipes = result["results"]
        
        #link = recipes[1] 
        #ingredients = recipes[2] 
        binding.pry
    end

    def get_recipes
      name = @recipes.each {|array| array[0]}
    end

    def get_ingredients

    end

  end
end