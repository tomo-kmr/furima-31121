class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_top

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
  def order_destination_params
    params.require(:order_destination).permit(:postal_code, :address_pref_id, :address_city, :address_num, :address_build, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_top
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end
end

