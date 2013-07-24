module ApplicationHelper
    #finds the current LTC price from BTC-e.com and returns it
    def ltc_price()
      @response = HTTParty.get("https://www.btc-e.com/api/2/ltc_usd/ticker")
      @JSON = JSON.parse(@response)
      @price = @JSON['ticker']['sell']
    end

    def btc_price()
        @response = HTTParty.get("https://www.btc-e.com/api/2/btc_usd/ticker")
        @JSON = JSON.parse(@response)
        @price  = @JSON['ticker']['sell']
    end
end
