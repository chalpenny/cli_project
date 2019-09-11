    require 'pry'
puts "Hello from CliProject::CLI"


module CliProject
  class CLI  
     
     def start 
      CliProject::API.new.import
       puts "Hello and welcome to your recipe finder CLI! What do you want to search for?"
       @input = nil 
       menu
       while @input != "exit" 
        @input = gets.chomp
        if @input == "menu"
          menu
        elsif @input == "1"
          print_recipes
          puts "What number recipe would you like to see? (1-#{recipes_list.count})"
            @input == gets.chomp
            display_recipe(@input)
          puts "Type '1' to see the recipe list again"  
          puts "or type 'menu' or 'exit'"
         
        elsif @input == "2"
          puts "-method to display ingredients"
          puts "What ingredient would you like to see recipes for?"

          puts "-method to display recipes and link by word search-"

          puts "Type '2' to see the ingredients list again"
          puts "or type 'menu' or 'exit'"
          
        elsif @input == "3"
          puts "Enter an ingredient to search for:" 

          puts "-method to return by word search or puts..
          Here are your results:  OR
          Sorry, we don't have any recipes that match your search.  Try again, or type '2' to see a list of possible ingredients.-"

          puts "or type 'menu' or 'exit'"
        elsif @input == "exit" 

        else
          puts "Sorry, we don't have any recipes that match your search.  Try typing 'menu' to start again"
        end
      end
      puts "I hope you found a great recipe! Happy cooking!"
     end
         
    def menu
      puts <<-LIST
       1. Browse recipes
       2. Browse recipes by ingredient
       3. Search by ingredient
       Type 'menu' to see the menu again
       or type "exit" at any time.
       LIST
     end
     
     
     def recipes_list
      API.new.import
       # binding.pry
    end

    def print_recipes
      recipes_list.collect.with_index {|recipe, index| puts "#{index+1}. #{recipe.name}"}
       # binding.pry
    end

    def display_recipe(input)
      Recipe.find(input.to_i)
    end

    def print_ingredients
      Recipe.all.collect {|recipe| "#{recipe.ingredients}"}
     binding.pry
    end

    def check_input
      @input = gets.chomp
     # method to make sure it's valid? or to check for 'menu' or 'exit'?
    end

    def exit

    end

      #instructions - enter an ingredient(s), keywords, 
      #return a list of recipes including that ingredient
        #- Alternate idea: search the returned recipes by other ingredients
        #-show filtered list
          #-optional: search by tags like vegetarian, dessert, etc
      #"what recipe do you want to see?" 
      #show full recipe 
      #"do you want to search again?"
      #return error message when input is not recognized/no match
      #"thanks for using my CLI and happy cooking!"
      
      
    
  end
end