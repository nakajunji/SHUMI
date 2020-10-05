class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy show]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy; end

  def show
    @posts = Post.where(user_id: @user.id)
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :hobby, :introduction, :profile_image)
  end
end
