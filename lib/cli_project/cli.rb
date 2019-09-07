    require 'pry'
puts "Hello from CliProject::CLI"


module CliProject
  class CLI  
     
     def start 
       puts "Hello and welcome to your recipe finder CLI! What do you want to search for?"
       @input = nil 
       menu
       while @input != "exit" && @input != "quit"
        @input = gets.chomp
        if @input == "help" || @input == "menu"
          menu
        elsif @input == "1"
          print_recipes
          puts "What number recipe would you like to see? (1-x)"
          @input == gets.chomp 
          # Show the corresponding ingredients list.  Ask if they want to get the link to recipe, or go back to list NOTE: do i need an ingredients class?  
          # 'type 'menu' to go back to menu' / or type 'menu'
        elsif @input == "2"
          # Print list of ingredients
          # 'What ingredient would you like to see recipes for? (type 1 - x') / or type 'menu'
          # Get input, return recipe names. Ask if they want to get the link to recipe, or go back to list
          # 'type 'menu' to go back to menu' / or type 'menu'
        elsif @input == "3"
          # You can search by up to 3 ingredients
          # Enter ingredient 1:
          # Enter ingredient 2:
          # Enter ingredient 3:
          # Here are your results:
          # Sorry, nothing matches your search.  Try again, or press 2 to see the list of possible ingredients. / 
          #'type 'menu' to go back to menu' / or type 'menu'
        elsif @input == "exit" || @input == "quit"

        else
          puts "Sorry, we don't have any recipes that match.  Try typing 'help' or 'menu' to search again"
        end
      end
      puts "I hope you found a great recipe! Happy cooking!"
     end
         
    def menu
      puts <<-LIST
       1. Browse recipes
       2. Browse ingredients
       3. Search by multiple ingredients
       Type 'help' or 'menu' to see the menu again
       or type "exit" or "quit" at any time to exit the program.
       LIST
     end
     
     def print_recipes
      Recipe.all.collect
      .with_index(1) do |recipe, index|
        puts "#{index}. #{recipe}"
     end
    end

    def print_ingredients

    end

    def prompt_for_input
      @input = gets.chomp
     # method to make sure it's valid
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