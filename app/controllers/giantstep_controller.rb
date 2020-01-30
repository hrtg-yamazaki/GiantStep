class GiantstepController < ApplicationController

  before_action :redirect_to_mypage, only: :index

  def index
  end

  private
  def redirect_to_mypage
    redirect_to mypage_index_path if user_signed_in?
  end
  
end
