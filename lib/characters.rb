# in charge of making a character a character. It's the model.
require 'pry'

class Marvel::Characters
    
    attr_accessor :name, :resource_uri, :description, :comics

    def self.mass_create_from_api(marvel_array)
        #iterating through the array of hashes to get the name keys and url keys
        marvel_array.each do |marvelhash|
            # self. is implied b/c we're in a class method
            new(marvelhash["name"], marvelhash["resourceURI"], marvelhash["description"], marvelhash["comics"]) #These are the keys to open the doors to the data specified
        end
    end

    @@all = []
    
    def initialize(name, resource_uri, description, comics)
        # binding.pry
        @name = name
        @resource_uri = resource_uri  #this method works with my APIManager.get_character_info
        @description = description
        @comics = comics.length
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def full? #checks to see if there is data in the @description instance variable. Works with the Marvel::CLI.display_single_character method
        !!@description
        !!@comics
    end
    
    def to_s #when a character is printed, this is what we'll see. works with my Marvel::CLI.display_characters method
        name.capitalize
    end




end