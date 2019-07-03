class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show; end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
