# encoding: utf-8
class PromotionController < ApplicationController
  def show
  
    return render :json=>Promotion.get_by_id({:id=>params[:id]})
  end
  
 # list api always return json
  # input: 
  # => {page,pagesize,refreshts,sort,lng,lat}
  # => sort : 1   --- newest 3: ---neareast
  # ouput:
  # => {}
  def list
    return render :json=>Promotion.list_by_page({
      :page=>params[:page],
      :pagesize=>params[:pagesize],
      :type=>params[:type],
      :refreshts=>params[:refreshts],
      :sort=>params[:sort],
      :lng=>params[:lng],
      :lat=>params[:lat]
    })
    
  end


end
