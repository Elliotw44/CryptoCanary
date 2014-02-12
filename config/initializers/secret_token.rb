# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist(token_file)
        File.read(token_file).chomp
    else
        #generate new token
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

#MiningApp::Application.config.secret_key_base = secure_token
MiningApp::Application.config.secret_token = '97abfaf2178034490b3cc1c27b22bcc2e09bf012d67b5de6d80c8e9316d963ea7145add472d36cb038b3ac7ed77f9e0c2e5c1408928695cd9ac2f31c7e6bae99'
