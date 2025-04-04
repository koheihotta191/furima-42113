class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :redirect_if_not_allowed, only: [:edit, :update]
  

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end


  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price, :image)
  end


  def correct_user
    return if current_user.id == @item.user.id
    redirect_to root_path
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_allowed
    # 現在のユーザーが商品を出品していない、または商品が売却済みであればトップページへリダイレクト
    if current_user.id != @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

















end
