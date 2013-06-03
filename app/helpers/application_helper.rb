module ApplicationHelper

    def ltc_price()
      @response = HTTParty.get("https://www.btc-e.com/api/2/ltc_usd/ticker")
      @JSON = JSON.parse(@response)
      @ticker = @JSON['ticker']
      @price = @ticker['sell']
    end
end
