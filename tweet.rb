# -*- coding: utf-8 -*-
require 'twitter'
require 'mysql'
require 'yaml'
require 'time'
conf_file = './config.yml'

client = Twitter::REST::Client.new do |config|
  setting = YAML::load_file(conf_file)

  config.consumer_key        = setting['consumer_key']
  config.consumer_secret     = setting['consumer_secret']
  config.access_token        = setting['access_token']
  config.access_token_secret = setting['access_token_secret']
end

timeline = client.user_timeline("shigemk2", :count => 150).collect do |tweet|
  p "#{tweet.created_at} #{tweet.user.screen_name}: #{tweet.text}"

  my = Mysql.connect("localhost", "root", nil, "TWITTER")
  stmt = my.prepare('insert into TWITTER (TIME,NAME,COMMENT) values (?,?,?)')
  stmt.execute Time.parse(tweet.created_at.to_s).to_i, tweet.user.screen_name, tweet.text
end
