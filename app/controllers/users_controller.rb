class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    #if current_user.has_role?(:admin)
    #  @users = User.all
    #else
    #  redirect_to root_path, alert: 'You are not authorized to view the page.'
    #end
    @users = User.all.order(created_at: :desc)
    authorize @users, :index?
  end

  def show
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end