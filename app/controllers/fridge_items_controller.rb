class FridgeItemsController < ApplicationController

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_fridge_item
    @fridge_item = Fridge.find(params[:id])
  end

  def fridge_params
    params.require(:fridge_item).permit(:ingredient_id, :expiry_date, :user_id, :quantity)
  end
end
