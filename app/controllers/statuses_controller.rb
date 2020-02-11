class StatusesController < ApplicationController

  before_action :redirect_to_toppage
  before_action :confirm_calculated, only: :calculate
  before_action :set_user_status


  def index
    
  end

  def reflected
    
  end

  def calculate
    latest_record = current_user.records.order(updated_at: :desc).limit(1)
    @record = latest_record[0]

    @status.sleep += @record.sleep
    @status.study += @record.study
    @status.exercise += @record.exercise
    @status.diet += @record.diet
    @status.habit += @record.habit
    @status.aim += @record.aim
    @status.login += 1

    if @status.valid?
      if @status.save
        redirect_to mypage_index_path 
      else
        flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
        render 'statuses/index'
      end
    else
      flash.now[:alert] = 'エラーが発生しました。最初からやり直してください'
      render 'statuses/index'
    end
  end


  private

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

  def confirm_calculated
    
    latest_record = current_user.records.order(updated_at: :desc).limit(1)
    @record = latest_record[0]
    @status = current_user.status
    last_calculated = @status.updated_at.strftime("%Y%m%d%H%M%S").to_i
    last_recorded = @record.created_at.strftime("%Y%m%d%H%M%S").to_i

    if last_calculated >= last_recorded
      redirect_to reflected_statuses_path
    end
  end

  def set_user_status
    @status = current_user.status
  end

end
