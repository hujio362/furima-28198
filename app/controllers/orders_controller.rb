class OrdersController < ApplicationController
  before_action :item_find
  before_action :redirect_solditem
  before_action :authenticate_user!
  before_action :redirect_user
  
  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :building, :house_number, :tel_number).merge(user_id:current_user.id, item_id:params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(     
      amount: @item.price,  #購入金額の記述方法
      card: order_params[:token], 
      currency: 'jpy'
    )
  end

  def redirect_solditem
    redirect_to root_path if @item.order != nil
  end

  def redirect_user
    redirect_to root_path if current_user.id == @item.user.id
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
