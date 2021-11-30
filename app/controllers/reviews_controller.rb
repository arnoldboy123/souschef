class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe_id = @recipe.id
    @review.user_id = current_user.id
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe_id = @recipe.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to recipes_path(@recipe), notice: "Review was successfully created."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @review = Review.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if @review.update(review_params)
      redirect_to recipes_path(@recipe), notice: "Review was successfully updated."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
