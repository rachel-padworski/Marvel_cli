require 'pry'

class Marvel::APIManager

    BASE_URL = "http://gateway.marvel.com/"

    def self.get_characters(pagenum=1, limit=20)
        url = BASE_URL + "v1/public/characters?offset=#{(pagenum - 1)*limit}&limit=#{limit}&ts=1587050717&apikey=0e6da9b0406b51d304f7872042a57ad4&hash=b733c869c95dbf48f299839564347d98"
        res = HTTParty.get(url)
        Marvel::Characters.mass_create_from_api(res["data"]["results"])
        # return {
        #     next: res["next"]
        #     prev: res["prev"]
        # } 
    end
  
    def self.get_more_character_info(input)
        url = input.resource_uri + "?ts=1587050717&apikey=0e6da9b0406b51d304f7872042a57ad4&hash=b733c869c95dbf48f299839564347d98"
        res = HTTParty.get(url)
        #binding.pry
        storycount= res["data"]["results"].first["stories"]["available"]
        input.story_count = storycount
    end

end