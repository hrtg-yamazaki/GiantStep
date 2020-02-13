class RecordsController < ApplicationController

  before_action :redirect_to_toppage
  before_action :confirm_recorded, except: [:recorded, :redirecting]

  def index
    
  end


  def recorded
    @status = current_user.status
  end


  def new
    @record = Record.new
    @yardstick = current_user.yardstick
  end


  def create

    @record = Record.new(record_params)

    if @record.valid?(:record_create)
      if @record.save
        redirect_to redirecting_records_path
      else
        render 'records/new'
      end
    else
      render 'records/new'
    end
    
  end


  def redirecting
    @status = current_user.status
  end


  private

  def record_params
    params.require(:record).permit(
      :sleep, :study, :exercise, :diet, :habit, :aim
    ).merge(login: 1, user_id: current_user.id)
  end

  def redirect_to_toppage
    redirect_to root_path unless user_signed_in?
  end

  def confirm_recorded
    if current_user.records.any?
      latest_record = current_user.records.order(updated_at: :desc).limit(1)
      @record = latest_record[0]
      today = Time.now
      if @record.created_at.strftime("%Y%m%d") == today.strftime("%Y%m%d")
        redirect_to recorded_records_path
      end
    end
  end

end
