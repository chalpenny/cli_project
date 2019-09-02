puts "Hello from CliProject::API"

require "open-uri"
require "json"

module CliProject
  class API 
    
    def self.list_recipes
      data = open("http://www.recipepuppy.com/api/").read
      JSON.parse(data)
    end
    
  end
end