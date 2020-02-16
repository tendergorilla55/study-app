class WeightRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[index]

  def index
    records = WeightRecord.all.order(created_at: 'DESC')
    respond_to do |format|
      format.html
      format.json { render json: records, include: [:user] }
    end
  end

  def create
    record = WeightRecord.new(weight_params)
    if record.save
      render json: { render: :index, status: :ok }
    else
      render json: { render: :index, status: :ng }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def weight_params
    params.require(:record).permit(:weight, :fat_percentage, :measuring_date).merge(user_id: current_user.id)
  end
end
