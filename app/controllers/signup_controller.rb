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
        setting_default_yardstick
        if @status.save && @yardstick.save
          redirect_to complete_signup_index_path
        else
          flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
          render "signup/profile"
        end
      else
        flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
        render "signup/profile"
      end
    else
      flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
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

  def setting_default_yardstick
    @yardstick = Yardstick.new(
      sleep: "睡眠時間。7時間〜9時間：２Opt、6時間〜7時間：１pt、それ以外：０pt",
      study: "課外、自主学習。1時間〜：２pt、30分〜：１pt、それ以下：０pt",
      exercise: "散歩以上の負荷の運動。1時間〜：２pt、30分〜：１pt、それ以下：０pt",
      diet: "食生活。野菜の摂取、脂質の制限でそれぞれ１pt。",
      habit: "嗜好品、悪癖への対処。禁煙、禁酒でそれぞれ１pt。",
      aim: "その他の日次目標。趣味や家事などの取り組みへの満足度で各自採点してください。",
      user_id: current_user.id
    )
  end

end
