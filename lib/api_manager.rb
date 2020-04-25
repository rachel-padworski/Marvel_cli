class Marvel::APIManager

    extend Marvel::Hasher

    BASE_URL = "http://gateway.marvel.com/"

    def self.get_characters(pagenum=1, limit=20)
        url = BASE_URL + "v1/public/characters"
        query = url_query
        query["offset"] = (pagenum - 1)*limit
        query["limit"] = limit
        res = HTTParty.get(url, query: query)
        Marvel::Characters.mass_create_from_api(res["data"]["results"])
    end
  
    def self.get_more_character_info(input)
        url = input.resource_uri 
        res = HTTParty.get(url, query: url_query)
        storycount= res["data"]["results"].first["stories"]["available"]
        input.story_count = storycount
    end

end