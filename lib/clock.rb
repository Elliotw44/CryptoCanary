require 'config/boot'
require 'config/environment'
require 'clockwork'
include Clockwork

every(3.minutes, 'crypto_prices.ltc')
every(3.minutes, 'crypto_prices.btc')
