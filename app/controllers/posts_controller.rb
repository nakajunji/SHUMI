class PostsController < ApplicationController
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

  def edit; end

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
      @posts = Post.tagged_with(params[:tag_name]).page(params[:page]).per(5)
    elsif params[:q] # :title, :bodyで検索
      @posts = @q.result(distinct: true).page(params[:page]).per(5)
    else
      @posts = Post.page(params[:page]).per(5)
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
