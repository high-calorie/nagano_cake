class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render 'new'
    end
  end

  def index
  end
end
