class FridgeItemsController < ApplicationController
  before_action :find_fridge_item, only: [:edit, :update, :destroy]

  def index
    @fridge_item = FridgeItem.all
    @fridge_item = @fridge_item.where(user_id == current_user.id)
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_fridge_item
    @fridge_item = FridgeItem.find(params[:id])
  end

  def fridge_params
    params.require(:fridge_item).permit(:ingredient_id, :expiry_date, :user_id, :quantity)
  end
end
