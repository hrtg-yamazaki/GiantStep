class MypageController < ApplicationController

  before_action :redirect_to_toppage

  def index
    
  end

  private
  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

end
