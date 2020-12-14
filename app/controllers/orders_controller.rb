class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new(params[:id])
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

  def show
  end

  
  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :building, :house_number, :tel_number).merge(user_id:current_user.id, item_id:params[:item.id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5aaa14041e9ed423c0451b46" 
    Payjp::Charge.create(
      amount: order_params[:price],  #購入金額の記述方法
      card: order_params[:token], 
      currency: 'jpy'
    )
  end
end
