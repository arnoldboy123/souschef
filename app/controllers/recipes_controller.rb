class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update destroy mark_done]

  def index
    if params[:query].present?
      @recipes = Recipe.search_by_name_and_description(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @review = Review.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.creator = current_user
    params["recipe"]["ingredient_ids"][1..-1].each do |id|
      if @recipe.ingredients.empty?
        recipe_item = RecipeItem.new
        recipe_item.ingredient = Ingredient.find_by_id(id)
        recipe_item.recipe = @recipe
        recipe_item.save
      else
        recipe_item = RecipeItem.new
        recipe_item.ingredient = Ingredient.find_by_id(id)
        recipe_item.recipe = @recipe
        recipe_item.save
      end
    end
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

  def mark_done
    items = @recipe.recipe_items.load_target
    fridge_hash
    items.each do |item|
      if @fridge_items.has_key?(item.ingredient.name)
        fridge_item = FridgeItem.where(ingredient_id: item.ingredient_id).first
        new_amount = fridge_item.quantity -= item.quantity
        if new_amount < 1
          fridge_item.destroy
        else
          fridge_item.update!(quantity: new_amount)
        end
      end
    end
    redirect_to recipe_path(@recipe)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :cooking_time, :description, :photo, :ingredient_ids)
  end

  def fridge_hash
    @fridge_items = {}
    FridgeItem.all.select{ |item| item.user = current_user }.each do |item|
      @fridge_items[item.ingredient.name] = 1
    end
  end
end
