module PoolsHelper
    
    def invpool_stats(apikey)
        @response = HTTParty.get("http://www.invasionnetwork.com/api?api_key=#{apikey}")
        JSON.parse(@response)
    end

    def wemineltc_stats(apikey)
        @response = HTTParty.get("http://www.wemineltc.com/api?api_key=#{apikey}")
        JSON.parse(@response)
    end

    def givemeltc_stats(apikey)
        @response = HTTParty.get("http://www.give-me-ltc.com/api?api_key=#{apikey}")
        JSON.parse(@response)
    end

    def litecoinpool_stats(apikey)
        @response = HTTParty.get("http://www.litecoinpool.org/api?api_key=#{apikey}")
        JSON.parse(@response) 
    end

    def poolitzod_stat(apikey)
         @response = HTTParty.get("http://pool.itzod.ru/apiex.php?act=getuserstats&key=#{apikey}")
         JSON.parse(@response)
    end

    def hypernova_stats(apikey)
        @response = HTTParty.get("https://hypernova.pw/api/key/#{apikey}/")
        JSON.parse(@response)
    end

end
