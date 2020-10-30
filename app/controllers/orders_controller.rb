class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_top
  before_action :set_item

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合
  def order_destination_params
    params.require(:order_destination)
          .permit(:postal_code, :address_pref_id, :address_city, :address_num, :address_build, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_top
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id || Order.exists?(item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_destination_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
