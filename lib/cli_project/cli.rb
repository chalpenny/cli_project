    require 'pry'
puts "Hello from CliProject::CLI"


module CliProject
  class CLI  
     
     def start 
       #greeting
       #puts "Hello and welcome to your recipe finder.  What do you want to search for?
       
       #Search for an ingredient by number:
       
       puts "Hello and welcome to your recipe finder CLI!"
       @input = nil 
       menu
       while @input != "exit" && @input != "quit"
        @input = gets.chomp
        if @input == "help"
          menu
        elsif @input == "1"
          puts "Print list of recipes"
          #can manage this with a method, see below
          prompt_for_recipe
        elsif @input == "2"
          puts "Print list of ingredients"
        elsif @input == "3"

        elsif @input == "exit" || @input == "quit"

        else
          puts "Sorry!  I didn't understand that.  Try typing 'menu'"
        end
      end
      puts "Thanks for using our CLI.  Happy cooking!"
     end
         
    def menu
      puts <<-LIST
       1. List all recipes
       2. List all ingredients
       3. Search by ingredient
       Type 'help' to see the menu options
       or type "exit" or "quit" at any time to exit the program.
       LIST
     end
     
     def print_recipes
      Recipe.all.each.with_index(1) do |recipe, index|
        puts "#{index}. #{recipe}"
     end
    end

    def prompt_for_recipe
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