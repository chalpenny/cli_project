    require 'pry'
puts "Hello from CliProject::CLI"


module CliProject
  class CLI  
     
      def run
        puts "Hello and welcome to your recipe finder CLI! What do you want to search for?"
          menu
          start_search
      end

     def start_search
       @input = nil 
       #menu
       @input = gets.chomp
       #while @input != "exit" 
        # @input = gets.chomp
        # if @input == "menu"
        #   menu
        menu_method
        exit_method
        if @input == "1"
          print_recipes
          @input = gets.chomp #-verify that input is not letters or it will return 0-
          return_recipe(@input)
          puts ""
          puts "Type '1' to see the list of recipes again"  
          puts "or type 'menu' or 'exit'"
         # @input = gets.chomp
          start_search
         # get_input(@input) #-what happens if they enter a number not on the list?-
         
        elsif @input == "2"
          print_ingredients
          @input = gets.chomp #-verify that input is not letters or it will return 0-
          return_recipe(@input)
          puts ""
          puts "Type '2' to see the list of recipes again"  
          puts "or type 'menu' or 'exit'"
         # @input = gets.chomp
          start_search
          menu_method
          exit_method
        elsif @input == "3"
          puts "Enter an ingredient to search for:" 
          ingredient_search
          #"Here are your results:  OR
          #Sorry, we don't have any recipes that match your search.  Try again, or type '2' to see a list of possible ingredients.-"
          puts "Type '3' to search again"
          menu_or_exit

       # elsif @input == "exit" 

        else
          puts "Sorry, we don't have any recipes that match your search.  Try typing 'menu' to start again"
      end
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
    end

    def print_recipes
      recipes_list.collect.with_index {|recipe, index| puts "#{index+1}. #{recipe.name}"}
      puts ""
      puts "What number recipe would you like to see? (1-#{recipes_list.count})"
    end

    # def print_ingredients
    #   recipes_list.collect.with_index {|recipe, index| puts "#{index+1}. #{recipe.ingredients}"}
    #   puts ""
    #  # Recipe.all.collect {|recipe| "#{recipe.ingredients}"}
    #   puts "What ingredient would you like to see recipes for?"
    # end
     # OR Recipe.all.collect {|recipe| "#{recipe.ingredients}"}

    def print_ingredients
      ingredients = []
      ingredients = recipes_list.collect do |recipe| "#{recipe.ingredients}"
      end
      data = ingredients.join(", ").split(", ").uniq
      data.collect.with_index {|name, index| puts "#{index+1}. #{name}"}
      puts ""
      puts "What ingredient would you like to see recipes for?"
    end

    def get_input(input)
      @input = gets.chomp
      if @input == "exit"

      elsif @input == "menu"
          menu
      else @input = gets.chomp
     # else puts "Please enter a number from the list"      
      end
    end
    
    def return_recipe(input)
      Recipe.find(@input)
    end

    def menu_method
      if @input == "menu"
          menu
          start_search
      end
      end
    
    def exit_method
      if @input == "exit"
        puts "I hope you found a great recipe! Happy cooking!"
      end
    end
    # def menu_or_exit
    #   #puts "or type 'menu' or 'exit'"
    #   if @input == "exit"

    #   else @input == "menu"
    #       menu
    #   end
    # end

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