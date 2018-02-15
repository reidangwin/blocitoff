class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    @user.is_public? || @user == @current_user
  end

  def update?
    @user == @current_user
  end

  def toggle_public?
    @user == @current_user
  end

end
