Class CryptoPricesJob
    #finds the current LTC and BTC prices from BTC-e.com and returns it
    def ltc()
      @response = HTTParty.get("https://www.btc-e.com/api/2/ltc_usd/ticker")
      @JSON = JSON.parse(@response)
      @LTC_price = @JSON['ticker']['sell']
      if(@LTC_price.size() > 12)
      else
        CryptoPrices.create! :LTC => @LTC_price
      end
    end

    def btc()
        @response = HTTParty.get("https://www.btc-e.com/api/2/btc_usd/ticker")
        @JSON = JSON.parse(@response)
        @BTC_price  = @JSON['ticker']['sell'] 
        if(@BTC_price.size() > 12)
        else
          CryptoPrices.create! :BTC => @BTC_price
        end
    end
end
