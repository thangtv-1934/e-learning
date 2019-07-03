class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show; end

  def follow
    @user = User.find params[:follow_user_id]
    current_user.follow @user
    redirect_to root_path
  end

  def unfollow
    @user = User.find params[:unfollow_user_id]
    current_user.unfollow @user
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
