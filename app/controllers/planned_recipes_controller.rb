class PlannedRecipesController < ApplicationController
  before_action :find_planned_recipe, only: %i[show edit update]
  skip_before_action :verify_authenticity_token

  def index
    @planned_recipes = PlannedRecipe.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @planned_recipe = PlannedRecipe.new
  end

  def create
    @planned_recipe = PlannedRecipe.new(planned_recipe_params)
    @planned_recipe.user_id = current_user.id
    if @planned_recipe.save
      redirect_to planned_recipes_path(@planned_recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @planned_recipe.update(planned_recipe_params)
    redirect_to planned_recipes_path(@planned_recipe)
  end

  def planner
    days = params[:days]
    @planner_recipes = PlannedRecipe.where.not(date: nil).order(:date)
    @future_meals = @planner_recipes.select { |meal| meal.date > Date.today }
    today = @future_meals.count < 1 ? Date.today : PlannedRecipe.where.not(date: nil).order(:date).last.date
    i = 1
    days.to_i.times do
      PlannedRecipe.create!(date: today + i, user: current_user, recipe: Recipe.last)
      today += 1.day
    end
    @planner_recipes = PlannedRecipe.where.not(date: nil).order(:date)
    @all_recipes = Recipe.where(creator: current_user)
    @future_meals = @planner_recipes.select { |meal| meal.date > Date.today }
  end

  def shopping_list
    @meals = PlannedRecipe.where.not(date: nil).all.select{ |meal| meal.date > Date.today }
    shopping_list = {}
    @meals.each do |meal|
      meal.recipe.recipe_items.each do |item|
        if shopping_list.has_key?(item.ingredient.name)
          shopping_list[item.ingredient.name] += item.quantity
        else
          shopping_list[item.ingredient.name] = item.quantity
        end
      end
    end
    @shopping_list = shopping_list
    @fridge_items = {}
    FridgeItem.all.select{ |item| item.user = current_user }.each do |item|
      @fridge_items[item.ingredient.name] = item.quantity
    end
    @shopping_list.each do |shopping, _vol|
      if @fridge_items.has_key?(shopping)
        @shopping_list[shopping] -= @fridge_items[shopping]
      end
    end
    return @shopping_list
  end

  def steal
    @planned_recipe = PlannedRecipe.new(recipe_id: params[:id])
    recipe = Recipe.find(params[:id].to_i)
    @planned_recipe.user_id = current_user.id
    if @planned_recipe.save!
      redirect_to recipes_path(recipe)
    end
  end

  private

  def find_planned_recipe
    @planned_recipe = PlannedRecipe.find(params[:id])
  end

  def planned_recipe_params
    params.require(:planned_recipe).permit(:date, :recipe_id)
  end
end
