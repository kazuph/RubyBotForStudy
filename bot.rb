#!/usr/bin/env ruby
# encoding: utf-8
require "twitter"
Twitter.configure do |config|
  config.consumer_key = 'lnnjDg4UrOYQpL2iq56Q'
  config.consumer_secret = 'EJnJxZGozCFp6Iwui8pJyhPg7gCyeQbHUxzWZMdvR4'
  config.oauth_token = '130326102-GBuxOMcO54I3dmvg0PnIuEL6bhny3rbovb8Hyrsb'
  config.oauth_token_secret = 'cqJhMIQmwN0OMUel4u8sgz7WVVFMwlZTQuiRmdnSa1w'
end

words = ["そんな実装で大丈夫か？", "お前が寝ている間にプログラミングしてる奴に勝てるのか？", "そんなコードで大丈夫か？", "m9( ･`д･´)プログラミングしろ！", "( ﾟДﾟ)ﾈﾑﾋｰ", "IE爆発しろ！", "テスト"];

p word = words[(rand * words.length).to_i] + words[(rand * words.length).to_i]

begin
    Twitter.update("@kazuph " + word)
    # Twitter.update(word)
rescue => ex
    puts "ERORR " + ex.message
end

