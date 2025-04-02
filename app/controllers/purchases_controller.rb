class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_if_not_allowed

  def index
    
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(item_id: @item.id)
  end


  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private


  def order_params
    params.require(:order_form).permit(:postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                # 通貨の種類（日本円）
      )
  end

  def redirect_if_not_allowed
    @item = Item.find(params[:item_id])
    return redirect_to root_path if @item.nil?
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end


end
