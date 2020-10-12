class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[edit update destroy show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to post_path(@post)
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
  end

  def index
    @q = Post.ransack(params[:q])
    if params[:tag_name] #タグの絞り込み
      @posts = Post.tagged_with(params[:tag_name]).order(created_at: :desc).page(params[:page]).per(8)
    elsif params[:q] # :title, :bodyで検索
      @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(8)
    else
      @posts = Post.order(created_at: :desc).page(params[:page]).per(8)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :post_image, :tag_list)
  end

end
