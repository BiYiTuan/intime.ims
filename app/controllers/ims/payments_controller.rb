# encoding: utf-8
require 'digest/sha1'

class Ims::PaymentsController < ApplicationController

  layout false

  #支付宝在微信中的支付中间页面
  def go
    @orderno=params[:orderno]
    @url=params[:url]
    @order_price=params[:order_price]
  end

  # 支付宝支付成功后现实用户到微信查看订单状态
  def alipay_success
  end
end
