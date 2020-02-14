class UsersController < ApplicationController

  before_action :redirect_to_toppage


  def index

    if params[:keyword]
      searched_users = User.where("nickname LIKE(?)","%#{params[:keyword]}%").limit(20)
      @users = []
      searched_users.each do |s_user|
        if s_user.privacy == "on_public"
          if s_user != current_user
            @users << s_user
          end
        end
      end
    end

  end


  def show

    @user = User.find(params[:id])
    if @user = current_user
      redirect_to mypage_index_path
    end
    @status = @user.status

  end


  private

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

end
