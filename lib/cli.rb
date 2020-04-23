#CLI controller...in charge of user interactions
require 'pry'

class Marvel::CLI

    def call
        Marvel::APIManager.get_characters
        welcome
        marvel_loop
        exit
    end

    def marvel_loop
        loop do
            menu
            input = get_character_choice 
            break if input == "exit"
            next if input == "invalid"
            display_single_character(input)
        end
    end

    def get_character_choice
        input = gets.strip.downcase
        return input if input == "exit"
        if !valid?(input)
            puts "\n\nError! Please enter valid input.\n\n\n"
            return "invalid"
        else
        return input.to_i - 1
        end
    end

    def display_characters
        Marvel::Characters.all.each.with_index do |character, index|
            puts "#{index+1}. #{character}"
            #overriding the to_s method from Ruby. printing out the characters. 
            #We don't want to see the object ID, but the object
        end
    end

    def display_single_character(input)
        m = Marvel::Characters.all[input]
        Marvel::APIManager.get_more_character_info(m) #if !m.full?
        puts "\n-----\nNAME:\n-----\n#{m}\n"
        puts "\n----\nBIO:\n----\n#{m.description}\n"
        puts "\n------\nCOMICS:\n------\n#{m} is in #{m.comics} comics.\n\n"
        puts "Press any key to view the list of characters."
        gets
      
    end

    def valid?(i)
        i.to_i.between?(1, Marvel::Characters.all.length)
    end

    def menu
        display_characters
        puts "\n\nPlease choose a character by number or type 'exit' to exit.\n\n"
    end

    def welcome
        puts "\n\n-------------------------------------------\n︽✵︽ Welcome to the world of Marvel! ︽✵︽\n-------------------------------------------\n\n"
        sleep(2)
    end

    def exit
        puts "\n\n---------------------------------\n'Part of the journey is the end.'\n---------------------------------\n\n"
    end



    # def call
    #     Marvel::APIManager.get_characters
    #     welcome
        
    #     menu
    # end

    # def display_characters
    #     Marvel::Characters.all.each.with_index do |character, index|
    #         puts "#{index+1}. #{character}"
    #         #overriding the to_s method from Ruby. printing out the characters. 
    #         #We don't want to see the object ID, but the object
    #     end
    #     # Marvel::APIManager.get_characters 
    # end

    # def display_single_character(input)
    #     m = Marvel::Characters.all[input]
    #     Marvel::APIManager.get_character_info(m) if !m.full?
    #     puts "\n-----\nNAME:\n-----\n#{m}\n"
    #     puts "\n----\nBIO:\n----\n#{m.description}\n\n"
        
    # end

    # #menu: options for the users.
    # def menu
    #     input = nil 
    #     while input != "exit"
            
    #         input = gets.strip.downcase
            
    #         if input.to_i.between?(0, Marvel::Characters.all.length - 1)
    #            display_single_character(input)
               
    #             # user_input = input.to_i 
    #             # user_input = gets.strip
    #             # if user_input == "exit"
    #             #     exit
    #             #     return
    #             # else
    #             #     display_single_character(user_input)
    #             # end
                
               

    #             # user_choice = gets.strip
    #             # if user_choice == "exit"
    #             #     exit
    #             #     #return
    #             # end
                
    #         # if input.to_i == 1
    #         #     # display_characters
    #         #     # puts "\n\nEnter the number of the character you'd like more information on or type 'exit.'\n\n"
                
    #         #     user_input = gets.strip
    #         #     if user_input == "exit"
    #         #         exit
    #         #         return
    #         #     end

    #         #     user_choice = user_input.to_i - 1
    #         #     if user_choice.between?(0, Marvel::Characters.all.length - 1)
    #         #         display_single_character(user_choice)
    #         #         puts "\nType 1 to view the character list or 'exit' to exit."
                    
    #         #     else
    #         #         puts "\n\nError! Type 'menu' to view the menu or 'exit' to exit.\n\n"
    #         #     end

    #         elsif input == "menu"
    #             puts "\n\nType 1 to view the list of Marvel characters or 'exit' to exit.\n\n"
    #         elsif input == "exit"
    #             exit
    #         else
    #             puts "\n\nError! Type 'menu' to view the menu or 'exit' to exit.\n\n"
    #         end
    #     end
    # end

    # def welcome
    #     puts "\n\n-------------------------------------------\n︽✵︽ Welcome to the world of Marvel! ︽✵︽\n-------------------------------------------"
    #     #puts "\nType 1 to view the list of characters or 'exit' to exit.\n\n"
    #     puts "\n\nEnter the number of the character you'd like more information on or type 'exit.'\n\n"
    #     sleep(2)
    #     display_characters
    #     input = gets.strip
    #     # if input.to_i == "exit"
    #     #     exit
    #     #     #return
    #     # end
    # end

    # def exit
    #     puts "\n\n---------------------------------\n'Part of the journey is the end.'\n---------------------------------\n\n"
    #     #return
    # end

 
end
