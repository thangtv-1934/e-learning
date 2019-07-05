class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    redirect_to admin_courses_path
  end

  private

  def admin_user
    redirect_to root_url unless current_user.is_admin?
  end
end
