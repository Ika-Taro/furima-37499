class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  # before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to item_path unless current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end

  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :take_for_shipping_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in? && current_user.id == item.user_id
  # end
end
