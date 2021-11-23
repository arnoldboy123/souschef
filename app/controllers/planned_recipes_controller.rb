class PlannedRecipesController < ApplicationController
  before_action :find_planned_recipe, only: %i[show edit update]

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

  def planner(days)
    today = Date.today
    planner_dates = []
    i = 1
    days.to_i.times do
      PlannedRecipe.create!(date = today + i)
      today += 1.day
    end
    @planned_recipes = PlannedRecipe.where(date: [nil, ""])
  end

  private

  def find_planned_recipe
    @planned_recipe = PlannedRecipe.find(params[:id])
  end

  def planned_recipe_params
    params.require(:planned_recipe).permit(:date)
  end
end
