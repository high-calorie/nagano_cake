class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
      @items = Item.all
      @genres = Genre.all
    if params[:item_id].present?
      #presentメソッドでparams[:item_id]に値が含まれているか確認 => trueの場合下記を実行
      @item = Item.find(params[:item_id])
      @items = @genre.items
    end
  end

  private

  def item_params
      params.require(:item).permit(:image, :name, :net_price)
  end

end