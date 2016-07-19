class StaticPagesController < ApplicationController
  def home    
    return if params[:user_id].nil? || params[:user_id] == ""
    @user_id = params[:user_id]
    initFlickraw   
  end
end
