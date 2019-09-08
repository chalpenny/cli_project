puts "Hello from CliProject::API"

require "open-uri"
require "json"
require "pry"

module CliProject
  class API 
    
    @@all = []

    def self.list_recipes
      #@@all = []
      data = open("http://www.recipepuppy.com/api/").read
      result = JSON.parse(data)
     #binding.pry
    end

    def self.all
      @@all << list_recipes["results"]
     #binding.pry
    end

    def import #???
      @@all << list_recipes[results].collect do |x| Recipe.new_from_hash(x)
      end
    end

  end
end