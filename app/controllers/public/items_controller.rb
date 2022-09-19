class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genrees = Genre.all
    @tax = TAX
  if params[:item_id].present?
    #presentメソッドでparams[:item_id]に値が含まれているか確認 => trueの場合下記を実行
    @item = Item.find(params[:item_id])
    @items = @genre.items
  end
end 