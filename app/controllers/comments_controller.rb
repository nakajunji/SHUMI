class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
  	@post = Post.find(params[:post_id])
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @comments = @post.comments.order(created_at: :desc)
  	@comment = @post.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	if @comment.save
      render :index
    else
      render 'posts/show'
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	render :index
  end

  private

  def comment_params
  	params.require(:comment).permit(:comment_content, :post_id, :user_id)
  end
end
