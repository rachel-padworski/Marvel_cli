#CLI controller...in charge of user interactions

class Marvel::CLI

    def call
        puts "︽✵︽ Welcome to the world of Marvel! ︽✵︽"
        menu
        exit
    end

    def characters
        puts "Type a number to view the character's bio and comics:
        1. Hulk
        2. Iron Man
        3. Captain America
        4. Captain Marvel
        5. etc..."
        @characters = Marvel::Characters.all
    end

    #menu: what options users can choose to do.
    def menu
        puts "Type 1 to view the list of Marvel characters. Type 'menu' to view the menu. Type 'exit' to exit."
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
                when "1"
                    characters
                when "menu"
                    puts "Type 1 to view the list of Marvel characters. Type 'menu' to view the menu. Type 'exit' to exit."
                else
                    puts "Error. Type 'menu' to view the menu or 'exit' to exit."
            end
        end
    end

    def exit
        puts "Thanks for stopping by!"
    end
end