class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

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

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :explanation, :status_id, :delivery_cost_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
