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
    if @planned_recipe.update(planned_recipe_params)
      redirect_to planned_recipes_path(@planned_recipe)
    else
      render :new
    end
  end

  def planner
    days = params[:days]
    puts days
    today = Date.today
    i = 1
    days.to_i.times do
      PlannedRecipe.create!(date: today + i, user: current_user, recipe: Recipe.last)
      today += 1.day
    end
    @planner_recipes = PlannedRecipe.all
    @all_recipes = Recipe.where(creator: current_user)
  end

  private

  def find_planned_recipe
    @planned_recipe = PlannedRecipe.find(params[:id])
  end

  def planned_recipe_params
    params.require(:planned_recipe).permit(:date, :recipe_id)
  end
end
