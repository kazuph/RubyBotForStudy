#!/usr/bin/env ruby
# encoding: utf-8
require "twitter"
# 設定読み込み./config
twitter_config = Hash.new
file = File.open("config")
twitter_config = (eval File.read(file))

# keyセット
Twitter.configure do |config|
  config.consumer_key = twitter_config[:consumer_key]
  config.consumer_secret = twitter_config[:consumer_secret]
  config.oauth_token = twitter_config[:oauth_token]
  config.oauth_token_secret = twitter_config[:oauth_token_secret]
end

# Twitter.update(open('twitter.txt').readlines.shuffle.first)
Twitter.update(ARGV[0])
# p Twitter.home_timeline
