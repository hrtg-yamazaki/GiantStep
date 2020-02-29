class UsersController < ApplicationController

  before_action :redirect_to_toppage, except: [:sample_user, :login_as_sample]


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
    redirect_to mypage_index_path if @user == current_user

    if @user.privacy == "on_private"
      flash[:denied] = "アクセス権限がないためリダイレクトしました"
      redirect_to mypage_index_path
    end

    @status = @user.status

  end


  def sample_user

  end


  def login_as_sample

    sample_user = User.find_by(email: "sample@giantstep.com")
    session[:id] = sample_user.id
    sign_in User.find(session[:id])
    redirect_to mypage_index_path

  end

  
  private

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

end
