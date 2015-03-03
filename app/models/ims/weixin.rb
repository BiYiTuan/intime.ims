# encoding: utf-8
require 'cacheable'
class Ims::Weixin
  extend Cacheable

  def self.access_token(weixin_key)
    cache_get("wx_access_token_#{weixin_key[:app_id]}", 2.hours - 100.second) {
      resp = RestClient.get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{weixin_key[:app_id]}&secret=#{weixin_key[:app_secret]}")
      ActiveSupport::JSON.decode(resp)['access_token']
    }
  end

  def self.jsapi_ticket(weixin_key)
    cache_get("wx_jsapi_ticket_#{weixin_key[:app_id]}", 2.hours - 102.second) {
      resp = RestClient.get("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=#{access_token(weixin_key)}&type=jsapi")
      ActiveSupport::JSON.decode(resp)['ticket']
    }
  end

  # def self.renew
  #   client.delete 'wx_access_token'
  #   access_token
  # end


end
