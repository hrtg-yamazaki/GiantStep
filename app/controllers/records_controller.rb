class RecordsController < ApplicationController


  def index

  end


  def new
    @record = Record.new(user_id: current_user.id)
  end


  def create
    #保存に関する処理は後ほど記載
    redirect_to mypage_index_path
  end


end
