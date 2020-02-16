# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @item = ExpensesItem.new
  end

  def create
    @item = ExpensesItem.new(item_params)
  end

  private

  def item_params
    params.require(:expenses_item).permit(:purchase_date, :item_name, :price).merge(user_id: current_user.id)
  end
end
