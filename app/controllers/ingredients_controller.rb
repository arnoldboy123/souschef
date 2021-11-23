class IngredientsController < ApplicationController
  before_action :find_ingredient, only: %i[show edit update destroy]
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = current_user.id
    if @ingredient.save
      redirect_to ingredients_path(@ingredient)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path(@ingredient)
    else
      render :new
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path(@ingredient)
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit, :calories, :price, :category)
  end
end
