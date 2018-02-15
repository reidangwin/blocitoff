class UsersController < ApplicationController
  before_action :find_user

  def show
    @item = Item.new
    @items = Item.where(user: @user)
  end

  def toggle_public
    if @user.update( is_public: !@user.is_public )
      flash[:notice] = "User was updated."
    else
      flash.now[:alert] = "There was an error saving the user. Please try again."
    end
  end

  private

  def find_user
    if params[:id]
      user_id = params[:id]
    elsif current_user
      user_id = current_user.id
    else
      user_id = 1
    end

    @user = User.find(user_id)
    authorize @user
  end
end
