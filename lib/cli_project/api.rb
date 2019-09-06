puts "Hello from CliProject::API"

require "open-uri"
require "json"

module CliProject
  class API 
    
    def self.list_recipes
      data = open("http://www.recipepuppy.com/api/").read
      JSON.parse(data)
      data.each do
        # data[0] = name
        # data[1] = link
        # data [2] = ingredients
      end
    end

    def get_recipes
      
    end

    def get_ingredients

    end

  end
end