class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :explanation, :status_id, :delivery_cost_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
