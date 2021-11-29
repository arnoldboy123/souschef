class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @recipes = Recipe.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.date = Date.today
    if @post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :recipe_id)
  end
end
