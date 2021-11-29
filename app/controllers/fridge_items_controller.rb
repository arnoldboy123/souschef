class FridgeItemsController < ApplicationController
  before_action :find_fridge_item, only: [:edit, :update, :destroy]

  def index
    @fridge_items = FridgeItem.all
    @fridge_items = @fridge_items.where(user_id: current_user)
  end

  def new
    if params[:query].present?
      @ingredients = Ingredient.search_ingredients(params[:query])
    else
      @ingredients = Ingredient.all
    end
    @fridge_item = FridgeItem.new
  end

  def create
    @fridge_item = FridgeItem.new(fridge_params)
    @fridge_item.user = current_user
    if @fridge_item.save
      redirect_to fridge_items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @fridge_item.update(fridge_params)
  end

  def destroy
    @fridge_item.destroy
  end

  def add
    item = params[:id]
    amount = params["fridge_item"]["quantity"].to_i
    fridge_hash
    if @fridge_items.has_key?(item)
      ingredient = Ingredient.where(name: item).first
      in_fridge = FridgeItem.where(ingredient_id: ingredient.id).first
      new_amount = in_fridge.quantity += amount
      in_fridge.update(quantity: new_amount)
    else
      addition = FridgeItem.new(quantity: amount)
      addition.user = current_user
      addition.ingredient = Ingredient.where(name: item).first
      addition.save!
    end
    redirect_to '/planned_recipes/shopping_list'
  end

  private

  def find_fridge_item
    @fridge_item = FridgeItem.find(params[:id])
  end

  def fridge_params
    params.require(:fridge_item).permit(:ingredient_id, :expiry_date, :user_id, :quantity)
  end

  def fridge_hash
    @fridge_items = {}
    FridgeItem.all.select{ |item| item.user = current_user }.each do |item|
      @fridge_items[item.ingredient.name] = 1
    end
  end
end
