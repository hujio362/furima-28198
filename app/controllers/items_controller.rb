class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :move_to_index #except: [:index, :show, :search]

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    # binding.pry
    # rescue ActiveRecord::RecordInvalid => e
    # p e.record.errors
    if @item.save
      redirect_to "/"   
    else
      render :new
    end
  end
  # 1.if bunno teigi
  # 2.redirect_to to render no tukaiwake
  # 3.params to @item no check(@item.image.blob)

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :price, :explanation, :status_id, :delivery_cost_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end