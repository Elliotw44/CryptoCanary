module ApplicationHelper
    #finds the current LTC price from BTC-e.com and returns it
    def ltc_price()
      @response = HTTParty.get("https://www.btc-e.com/api/2/ltc_usd/ticker")
      @JSON = JSON.parse(@response)
      @ticker = @JSON['ticker']
      @price = @ticker['sell']
    end

    def btc_price()
        @response = HTTParty.get("https://www.btc-e.com/api/2/btc_usd/ticker")
        @JSON = JSON.parse(@response)
        @ticket = @JSON['ticker']
        @price = @ticket['sell']
    end
end
