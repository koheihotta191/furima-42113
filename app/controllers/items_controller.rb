class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  

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


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price, :image)
  end


  def correct_user
    @item = Item.find(params[:id])
    return if current_user.id == @item.user.id
    redirect_to root_path
  end


  def set_item
    @item = Item.find(params[:id])
  end

















end
