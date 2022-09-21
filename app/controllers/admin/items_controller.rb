class Admin::ItemsController < ApplicationController
  def index
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :net_price, :item_image)
  end
end
