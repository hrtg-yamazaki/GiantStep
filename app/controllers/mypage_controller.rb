class MypageController < ApplicationController

  before_action :redirect_to_toppage


  def index
    @status = current_user.status
  end


  def profile
  end


  def yardstick
    @yardstick = current_user.yardstick
  end


  def yardstick_update
    @yardstick = current_user.yardstick
    if @yardstick.update(yardstick_params)
      redirect_to mypage_index_path
    else
      flash.now[:alert] = "正常に登録できませんでした"
      render 'mypage/yardstick'
    end
  end


  def error

  end


  private

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

  def yardstick_params
    params.require(:yardstick).permit(
      :sleep, :study, :exercise, :diet, :habit, :aim
    ).merge(user_id: current_user.id)
  end

end
