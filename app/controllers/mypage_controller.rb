class MypageController < ApplicationController

  before_action :redirect_to_toppage
  before_action :set_user_status, only: [:index, :profile]

  def index

  end


  def profile
    
  end


  def profile_edit
    @user = current_user
  end


  def profile_update
    @user = current_user
    @user.nickname = user_update_params[:nickname]
    @user.gender = user_update_params[:gender]
    @user.profile = user_update_params[:profile]
    if @user.valid?
      if @user.save
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to profile_mypage_index_path
      end
    else
      flash.now[:alert] = "最初からやり直してください"
      render "mypage/profile_edit"
    end
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

  def set_user_status
    @status = current_user.status
  end

  def user_update_params
    params.require(:user).permit(
      :nickname, :gender, :profile
    )
  end

  def yardstick_params
    params.require(:yardstick).permit(
      :sleep, :study, :exercise, :diet, :habit, :aim
    ).merge(user_id: current_user.id)
  end

end
