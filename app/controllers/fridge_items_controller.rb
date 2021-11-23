class FridgeItemsController < ApplicationController
  before_action :find_fridge_item, only: [:edit, :update, :destroy]

  def edit; end

  def update
    @fridge_item.update(fridge_params)
  end

  def destroy
    @fridge_item.destroy
  end

  private

  def find_fridge_item
    @fridge_item = Fridge_item.find(params[:id])
  end

  def fridge_params
    params.require(:fridge_item).permit(:ingredient_id, :expiry_date, :user_id, :quantity)
  end
end
