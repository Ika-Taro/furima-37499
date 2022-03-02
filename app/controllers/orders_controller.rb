class OrdersController < ApplicationController
  before_action :authenticate_user!,only: :index
  before_action :set_item, only: [:index, :create]

  
  def index
    @purchase_address = PurchaseAddress.new
    if @item.purchase_record.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def create
    @purchase_address = PurchaseAddress.new(order_params)
    
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.selling_price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
