class OrdersController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end


  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(order_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end
