class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.search_by_name_and_description(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path(@recipe)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooking_time, :description)
  end
end
