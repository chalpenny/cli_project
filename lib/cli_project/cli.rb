
module CliProject
  class CLI  

     def run
      puts "Hello and welcome to your recipe finder CLI! What do you want to search for?"
        @input = nil 
        menu
        start_search
      end

      def start_search
        while @input != "exit" 
        @input = gets.chomp
          if @input == "menu"
            menu

          elsif @input == "1"
            print_recipes
            get_input
            return_recipe(@input)
            
          elsif @input == "exit"  
          else 
            puts "Sorry, we don't have any recipes that match your search. Try typing 'menu' to start again" 
          end 
        end 
        puts "I hope you found a great recipe! Happy cooking!" 
    end
         

    def menu
      puts <<-LIST
       Type '1' to browse recipes.
       Type 'menu' to see the menu 
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
    
    def get_input
     @input = gets.chomp
      if @input.to_i.to_s == @input && @input.to_i.between?(1,10)
      puts "Great choice! Check this out:"
      else
        puts "Please type a number from the list"  
        start_search
      end
    end

  end
end