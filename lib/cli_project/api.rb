
require "open-uri"
require "json"
require "pry"

module CliProject
  class API 

    def list_recipes
      data = open("http://www.recipepuppy.com/api/").read
      result = JSON.parse(data)
      result["results"]
    end

    def import
      list_recipes.collect {|x| Recipe.new_from_hash(x)}
    end

  end
end