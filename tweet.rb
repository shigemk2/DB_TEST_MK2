require 'twitter'
require 'yaml'
conf_file = './config.yml'

client = Twitter::REST::Client.new do |config|
  setting = YAML::load_file(conf_file)

  config.consumer_key        = setting['consumer_key']
  config.consumer_secret     = setting['consumer_secret']
  config.access_token        = setting['access_token']
  config.access_token_secret = setting['access_token_secret']
end

client.user_timeline("shigemk2", :count => 3).collect do |tweet|
  p "#{tweet.user.screen_name}: #{tweet.text}"
end
