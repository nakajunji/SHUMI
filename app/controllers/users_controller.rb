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
    @q = User.ransack(params[:q])
    if params[:q]
      @users = @q.result(distinct: true).page(params[:page]).per(5)
    else
      @users = User.page(params[:page]).per(5)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :hobby, :introduction, :profile_image)
  end
end
