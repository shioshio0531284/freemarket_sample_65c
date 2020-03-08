class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to root_path, notice: "新規商品「#{item.name}」を登録しました。"
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

end
