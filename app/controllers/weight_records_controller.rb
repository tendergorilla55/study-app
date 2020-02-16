class WeightRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[index show]

  def index
    @weight = WeightRecord.new
  end

  private

  def set_user
    @user = current_user
  end

end
