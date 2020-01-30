class SignupController < ApplicationController

  def index
    @user = User.new
  end


  def keep

    @user = User.new(
      nickname: user_params[:nickname],
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    
    if @user.valid?(:keep)
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      redirect_to profile_signup_index_path
    else
      render "signup/index"
    end

  end


  def profile
    
  end

  def user_create
  end

  def complete

  end

  private
  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation, :nickname
    )
  end

end
