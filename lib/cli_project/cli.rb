    require 'pry'
puts "Hello from CliProject::CLI"


module CliProject
  class CLI  

     def run
      puts "Hello and welcome to your recipe finder CLI! What do you want to search for?"
      @input = nil 
       menu
        while @input != "exit" 
        @input = gets.chomp
          if @input == "menu"
            menu

          elsif @input == "1"
            print_recipes
            get_input
            return_recipe(@input)

          elsif @input == "2"
            print_ingredients         
            get_input
            return_recipes_by_ingredient(@input)
            
          elsif @input == "exit"  
          else 
            puts "Sorry, we don't have any recipes that match your search. Try typing 'menu' to start again" 
          end 
        end 
        puts "I hope you found a great recipe! Happy cooking!" 
    end
         

    def menu
      puts <<-LIST
       1. Browse recipes
       2. Search by ingredient
       Type 'menu' to see the menu again
       or type "exit" at any time.
       LIST
     end
     
     def recipes_list
      API.new.import
    end

    def print_recipes
      recipes_list.collect.with_index {|recipe, index| puts "#{index+1}. #{recipe.name}"}
      puts ""
      puts "What number recipe would you like to see? (1-#{recipes_list.count})"
    end
    
    def return_recipe(input)
      Recipe.find(@input)
      puts ""
      puts "Type '1' to see the list of recipes again"  
      puts "or type 'menu' or 'exit'"
    end

    def print_ingredients
      ingredients = []
      ingredients = recipes_list.collect do |recipe| "#{recipe.ingredients}"
      end
      data = ingredients.join(", ").split(", ").uniq
      data.collect.with_index {|name, index| puts "#{index+1}. #{name}"}
      puts ""
      puts "What number ingredient would you like to see recipes for? (1-#{data.count})"
    end

    def return_recipes_by_ingredient(input)
      Recipe.find(@input)
      puts ""
      puts "Type '2' to see the list of ingredients again"  
      puts "or type 'menu' or 'exit'"
    end

    def get_input
      input = gets.chomp
       if @input.is_a?(Integer) && @input.between?(1,10)
       @input
       #else puts "Please enter a number from the list"      
       end
     end
    
  end
end