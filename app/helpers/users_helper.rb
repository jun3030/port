module UsersHelper
  require 'net/http' #標準ライブラリの呼び出し
  require 'uri'
  require "json" #jsonを使うためのライブラリ

 def instagram
     
  res = Net::HTTP.get(URI.parse('https://graph.facebook.com/v3.3/17841407295738545?fields=name%2Cmedia.limit(5)%7Bcaption%2Clike_count%2Cmedia_url%2Cpermalink%2Ctimestamp%2Cusername%7D&access_token=EAAIP4sxeM2UBALeqIwIiZAsWpkfih2LZBMlhwZCTnIz6RUaXcUX17moISnBmZBnRMzZCJIzBXLrnAel9sgZATZBfMvWfnm4ZBCQjT3TtDZBKc5ZCZC5ARQbGhPQfg0eDfEzxmhlHUTTCgyEL80vmZAVrNzsORLmPZARWE7HS0h3II2uf67gZDZD'))
  @hash = JSON.parse(res)
 end
 
end
