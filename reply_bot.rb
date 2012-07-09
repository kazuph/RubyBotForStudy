#!/usr/bin/env ruby
# encoding: utf-8
# $ gem install twitter
require "twitter"
require "timeout"
require "./config.rb"
require "pp"

# 設定読み込み./config
# twitter_config = Hash.new
# file = File.open("config")
# twitter_config = (eval File.read(file))

# keyセット
user = $twitter_config[:user]
Twitter.configure do |config|
  config.consumer_key = $twitter_config[:consumer_key]
  config.consumer_secret = $twitter_config[:consumer_secret]
  config.oauth_token = $twitter_config[:oauth_token]
  config.oauth_token_secret = $twitter_config[:oauth_token_secret]
end

# つぶやく単語セット
words = ["テストコードが書け！", "お前が寝ている間にプログラミングしてる奴に勝てるのか？", "そんなコードで大丈夫か？", "m9( ･`д･´)プログラミングしろ！", "( ﾟДﾟ)ﾈﾑﾋｰ", "IE爆発しろ！", "テスト"]

# p word = words[(rand * words.length).to_i] + words[(rand * words.length).to_i]

# タイムラインを取得して特定のワードに対して
# 10秒でタイムアウト
# トライは3回まで
try_count = 0
begin
  try_count += 1
  my_tweets = timeout(10) do
    Twitter.user_timeline(user)
    # Twitter.update(user + word)
  end
  # ツイートを検索
  my_tweets.each do |tweet|
    # とりあえずコードって呟いてたらリプル
    if /コード/ =~ tweet.text
      print tweet.text, "\n"
      timeout(10) do
        word = words[(rand * words.length).to_i] + words[(rand * words.length).to_i]
        Twitter.update("@" + user + word + " " + tweet.id.to_s)
      end
    end
  end
rescue Timeout::Error => error
  # タイムアウトしたときに発動する
  puts "ERORR TIMEOUT " + error.message
  if try_count < 3
    sleep 1
    retry
  end
rescue => error
  # なにかのエラーで発動する
  puts "ERORR " + error.message
  if try_count < 3
    sleep 1
    retry
  end
end

# cronの設定
# */30 *  *  *  * USER_NAME bash -lc '/home/USER_NAME/cron/bot.rb'
# .bash_profile
# if [ -s ${HOME}/.rbenv ]; then
#         export PATH="$HOME/.rbenv/bin:$PATH"
#         eval "$(rbenv init -)"
#         source ~/.rbenv/completions/rbenv.bash
# fi
