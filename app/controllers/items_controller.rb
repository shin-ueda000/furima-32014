class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :item_set, only: [:show, :edit, :update,:destroy]

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
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  private

  def item_params
    params.require(:item).permit(:title,:description_of_item,:category_id,:product_condition_id,:shipping_charge_id,:shipping_area_id,:days_to_sip_id,:selling_price,:image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
