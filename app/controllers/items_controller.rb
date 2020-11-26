class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end
  private

  def item_params
    params.require(:item).permit(:title,:description_of_item,:category_id,:product_condition_id,:shipping_charge_id,:shipping_area_id,:days_to_sip_id,:selling_price,:image).merge(user_id: current_user.id)
  end
end
