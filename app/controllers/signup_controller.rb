class SignupController < ApplicationController


  def index
    @user = User.new
  end


  def keep

    @user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    
    if @user.valid?(:keep)
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      redirect_to profile_signup_index_path
    else
      render "signup/index"
    end

  end


  def profile
    @user = User.new
  end


  def user_create

    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      nickname: user_params[:nickname],
      gender: user_params[:gender],
      birthday: convert_params_into_date,
      profile: user_params[:profile],
    )
    if @user.valid?(:user_create)
      if @user.save
        session[:id] = @user.id
        sign_in User.find(session[:id]) unless user_signed_in?
        @status = Status.new(user_id: current_user.id)
        if @status.save
          redirect_to complete_signup_index_path
        else
          flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
          render "signup/profile"
        end
      else
        render "signup/profile"
      end
    else
      render "signup/profile"
    end

  end


  def complete

  end


  private

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation,
      :nickname, :gender, :profile, :birthday
    )
  end

  def convert_params_into_date
    year  = params[:birthday]["birthday(1i)"].to_i
    month = params[:birthday]["birthday(2i)"].to_i
    day   = params[:birthday]["birthday(3i)"].to_i
    
    if year != 0 && month != 0 && day != 0
      return Date.new(year, month, day)
    end
  end

end
