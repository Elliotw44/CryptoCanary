module WorkerHelper
    #gets the pool stats from invasion network
    def invpool_stats(apikey)
        @response = HTTParty.get("http://www.invasionnetwork.com/api?api_key=#{apikey}")
        JSON.parse(@response)
    end

end
