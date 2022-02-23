class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :take_for_shipping_id, :selling_price).merge(user_id: current_user.id)
  end

end
