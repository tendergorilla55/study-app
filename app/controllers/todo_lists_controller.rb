class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index

  end

  private
  def set_user
    @user = current_user
  end
end
