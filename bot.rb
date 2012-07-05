#!/usr/bin/env ruby
# encoding: utf-8
# $ gem install twitter
require "twitter"
require "./config.rb"
p @twitter_config

# 設定読み込み./config
# twitter_config = Hash.new
# file = File.open("config")
# twitter_config = (eval File.read(file))
#
# keyセット
user = @twitter_config[:user]
Twitter.configure do |config|
  config.consumer_key = @twitter_config[:consumer_key]
  config.consumer_secret = @twitter_config[:consumer_secret]
  config.oauth_token = @twitter_config[:oauth_token]
  config.oauth_token_secret = @twitter_config[:oauth_token_secret]
end

# つぶやく単語セット
words = ["そんな実装で大丈夫か？", "お前が寝ている間にプログラミングしてる奴に勝てるのか？", "そんなコードで大丈夫か？", "m9( ･`д･´)プログラミングしろ！", "( ﾟДﾟ)ﾈﾑﾋｰ", "IE爆発しろ！", "テスト"];

p word = words[(rand * words.length).to_i] + words[(rand * words.length).to_i]

# 投稿
begin
    Twitter.update(user + word)
    # Twitter.update(word)
rescue => error
    puts "ERORR " + error.message
end

# cronの設定
# */30 *  *  *  * USER_NAME bash -lc '/home/USER_NAME/cron/bot.rb'
# .bash_profile
# if [ -s ${HOME}/.rbenv ]; then
#         export PATH="$HOME/.rbenv/bin:$PATH"
#         eval "$(rbenv init -)"
#         source ~/.rbenv/completions/rbenv.bash
# fi
