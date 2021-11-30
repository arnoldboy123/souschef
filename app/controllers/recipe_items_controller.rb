class RecipeItemsController < ApplicationController

  def show
    @recipe_item = RecipeItem.find(params[:id])
  end

  def update
    @recipe_item = RecipeItem.find(params["recipe_item"]["id"])
    @recipe_item.update(recipe_item_params)
    redirect_to recipe_path(@recipe_item.recipe, anchor: "anchor-item")
  end

  private

  def recipe_item_params
    params.require(:recipe_item).permit(:quantity, :ingredient_id)
  end

end
