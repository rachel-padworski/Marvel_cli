require 'digest'

module Marvel::Hasher


    def url_query
        dt = Time.now.to_i.to_s
        want_to_hash = dt + ENV['APIKEY'] + ENV["PUBLICKEY"]
        hash = Digest::MD5.hexdigest want_to_hash

        url = "http://gateway.marvel.com/v1/public/comics"
        { 
            ts: dt, 
            apikey: ENV['PUBLICKEY'], 
            hash: hash
        }
    end

end