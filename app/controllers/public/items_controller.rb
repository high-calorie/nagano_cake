class Public::ItemsController < ApplicationController

  def index
      @items = Item.all
      @genres = Genre.all
    if params[:item_id].present?
      #presentメソッドでparams[:item_id]に値が含まれているか確認 => trueの場合下記を実行
      @item = Item.find(params[:id])
      @items = @genre.items
    end
  end

  def new
    @item = Item.new
  end

  def show
      @items = Item.all
      @item = Item.find(params[:id])
      @genres = Genre.all
      @cart_item = CartItem.new
  end

  private

  def item_params
      params.require(:item).permit(:image, :name, :introduction, :net_price)
  end

end