class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  private

  def find_user
    user_id = params[:user_id] || current_user.id
    @user = User.find(user_id)
  end
end
