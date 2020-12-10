class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(id: :DESC)
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
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy or current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :explanation, :status_id, :delivery_cost_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
