class FridgeItemsController < ApplicationController
  before_action :find_fridge_item, only: [:edit, :update, :destroy]

  def index
    @fridge_items = FridgeItem.all
    @fridge_items = @fridge_items.where(user_id: current_user)
  end

  def new
    @fridge_item = FridgeItem.new
  end

  def create
    @fridge_item = FridgeItem.new(fridge_params)
    @fridge_item.save
  end

  def edit; end

  def update
    @fridge_item.update(fridge_params)
  end

  def destroy
    @fridge_item.destroy
  end

  private

  def find_fridge_item
    @fridge_item = FridgeItem.find(params[:id])
  end

  def fridge_params
    params.require(:fridge_item).permit(:ingredient_id, :expiry_date, :user_id, :quantity)
  end
end
