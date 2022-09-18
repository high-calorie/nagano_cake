class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :net_price, :status)
  end
end
