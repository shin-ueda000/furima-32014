class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :purchase_form_set, only: [:index, :create]
  def index
    @purchase_form = PurchaseForme.new
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path 
    end
  end

  def create
    @purchase_form = PurchaseForme.new(orders_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def orders_params
    params.permit(:postal_code,:shipping_area_id,:municipalities,:address,:building_name,:phone_number,:item_id).merge(user_id:current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card:   params[:token],
      currency: 'jpy' 
    )
  end

  def purchase_form_set
    @item = Item.find(params[:item_id])
  end
end

