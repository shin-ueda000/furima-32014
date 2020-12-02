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
    params.permit(:postal_code,:shipping_area_id,:municipalities,:address,:building_name,:phone_number).merge(user_id:current_user.id,item_id:params[:item_id],token: params[:token])
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

# 1 controller: def index
# @item

# 2 index.html
# @item.image


# 3 購入ボタン
# 入力情報を空にして送信

# 4 def create
# @item
# if @purchase_form.valid? => error


# 5 index.html
# @item.image

# <%= form_with model: @purchase_form(error), url: item_orders_path, id: 'charge-form', class: 'transaction-form-wrap',local: true do |f(eeror)| %>
#   <%= render 'error_messages', model: f.object %>

