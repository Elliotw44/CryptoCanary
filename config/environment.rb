# Load the rails application
require File.expand_path('../application', __FILE__)
ENV['RECAPTCHA_PUBLIC_KEY'] = '6Lf3qOoSAAAAAPHqCQzegfrrSWChALwbNAOQZZaa8'
ENV['REPATCHA_PRIVATE_KEY'] = '6Lf3qOoSAAAAAEfje5fU8R_P7PPZKn6VrD6ql8m6'
# Initialize the rails application
MiningApp::Application.initialize!
