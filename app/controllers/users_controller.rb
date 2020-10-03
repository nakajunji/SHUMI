class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :destroy, :show]

  def edit
  end

  def update
    @user.update(user_params)
  end

  def destroy
  end

  def show
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :hobby, :introduction, :profile_image_id)
  end

end
