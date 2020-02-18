module UsersHelper
  require 'net/http' #標準ライブラリの呼び出し
  require 'uri'
  require "json" #jsonを使うためのライブラリ

 def instagram
  res = Net::HTTP.get(URI.parse('https://graph.facebook.com/v3.3/17841407295738545?fields=name%2Cmedia.limit(5)%7Bcaption%2Clike_count%2Cmedia_url%2Cpermalink%2Ctimestamp%2Cusername%7D&access_token=EAAIP4sxeM2UBALeqIwIiZAsWpkfih2LZBMlhwZCTnIz6RUaXcUX17moISnBmZBnRMzZCJIzBXLrnAel9sgZATZBfMvWfnm4ZBCQjT3TtDZBKc5ZCZC5ARQbGhPQfg0eDfEzxmhlHUTTCgyEL80vmZAVrNzsORLmPZARWE7HS0h3II2uf67gZDZD'))
  @hash = JSON.parse(res)
 end
 
 def insta
  token = "EAAHS37KdnQ8BABdEEttqSn8ydDf3QNZBOavqR8IRv8hRZCKTV3arrEDGnxIZAX4CELYRnfM63V9YeyFsbItbqDXdZAJ3h3N0XfmslAbcf2FHTX7qcmF5SLKKo8fTTouEb5S5oRncIShz6ZBdwhGEMAVVxwcF3P2fJSfDapSZAPBthL8bAWcjoEaJl6SDpsjbyIiodP8vY4wwVdZCLhg5apeniQS58I3Buws6wCKAh41lAZDZD"
  app_id = 513333192924431
  app_secret = "1d9c9b3e3fcb7e47d2059c6da1f6b23f"
  media_count = 20
      
  res = Net::HTTP.get(URI.parse("https://graph.facebook.com/v3.0/oauth/access_token?grant_type=fb_exchange_token&client_id=#{app_id}&client_secret=#{app_secret}&fb_exchange_token=#{token}"))
  second = JSON.parse(res)["access_token"]
  id = Net::HTTP.get(URI.parse("https://graph.facebook.com/v5.0/me?access_token=#{second}"))
  id = JSON.parse(id)["id"]
  third = Net::HTTP.get(URI.parse("https://graph.facebook.com/v5.0/#{id}/accounts?access_token=#{second}"))
  third = JSON.parse(third)
  third = third["data"][0]["access_token"]
  instagram_business_account = Net::HTTP.get(URI.parse("https://graph.facebook.com/v6.0/me?fields=instagram_business_account&access_token=#{third}"))
  instagram_business_account = JSON.parse(instagram_business_account)["instagram_business_account"]["id"]
    
    
  user_media = Net::HTTP.get(URI.parse("https://graph.facebook.com/v3.3/#{instagram_business_account}?fields=name%2Cmedia.limit(#{media_count})%7Bcaption%2Clike_count%2Cmedia_url%2Cpermalink%2Ctimestamp%2Cusername%7D&access_token=#{third}"))
  JSON.parse(user_media)
  
 end
end
