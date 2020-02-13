class StatusesController < ApplicationController

  before_action :redirect_to_toppage
  before_action :set_user_status


  def index
    
  end


  def calculate

    @status.sleep = 0
    @status.study = 0
    @status.exercise = 0
    @status.diet = 0
    @status.habit = 0
    @status.aim = 0
    @status.login = 0

    current_user.records.each do |record|
      @status.sleep += record.sleep
      @status.study += record.study
      @status.exercise += record.exercise
      @status.diet += record.diet
      @status.habit += record.habit
      @status.aim += record.aim
      @status.login += record.login
    end

    if @status.valid?
      if @status.save
        redirect_to mypage_index_path 
      else
        flash.now[:alert] = 'ステータスエラーが発生しました。'
        render 'mypage/report'
      end
    else
      flash.now[:alert] = 'ステータスエラーが発生しました。'
      render 'mypage/report'
    end

  end


  private

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

  def set_user_status
    @status = current_user.status
  end

end
