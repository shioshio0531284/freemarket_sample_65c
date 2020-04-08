class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :login_check, only: [:new, :edit, :update, :destroy]

  def index
    @items = Item.includes(:images).order('id DESC').limit(8)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def show

  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "商品を更新しました"
    else
      redirect_to edit_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to root_path, notice: '商品の削除に失敗しました'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :status, :postage, :delivery_way, :delivery_area, :delivery_day, :category, :brand, :size, images_attributes:[:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
