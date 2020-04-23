require 'pry'

class Marvel::APIManager

    BASE_URL = "http://gateway.marvel.com/"

    def self.get_characters
        url = BASE_URL + "v1/public/characters?ts=1587050717&apikey=0e6da9b0406b51d304f7872042a57ad4&hash=b733c869c95dbf48f299839564347d98"
        res = HTTParty.get(url)
        Marvel::Characters.mass_create_from_api(res["data"]["results"])
    end
  
    def self.get_more_character_info(input)
        url = BASE_URL + "resourceURI"
        res = HTTParty.get(url)
        description = res["description"]
        comics = res["comics"]
    end

end