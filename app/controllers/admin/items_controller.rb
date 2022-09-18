class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @item = Item.new(item_params)
    @item.genre_id = @genre.id
    if @item.save
      redirect_to item_path(@item)
    else
      @itemss = Item.all
      render 'index'
    end
  end

  def index
  end
end
