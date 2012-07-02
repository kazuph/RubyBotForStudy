#!/usr/bin/env ruby
# encoding: utf-8
require "twitter"
Twitter.configure do |config|
  config.consumer_key = 'lnnjDg4UrOYQpL2iq56Q'
  config.consumer_secret = 'EJnJxZGozCFp6Iwui8pJyhPg7gCyeQbHUxzWZMdvR4'
  config.oauth_token = '130326102-GBuxOMcO54I3dmvg0PnIuEL6bhny3rbovb8Hyrsb'
  config.oauth_token_secret = 'cqJhMIQmwN0OMUel4u8sgz7WVVFMwlZTQuiRmdnSa1w'
end
# Twitter.update(open('twitter.txt').readlines.shuffle.first)
Twitter.update("こんにちわこんにちわ !")
# p Twitter.home_timeline
