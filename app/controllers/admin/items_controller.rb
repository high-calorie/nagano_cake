class Admin::ItemsController < ApplicationController

    def index
        @items = Item.all

        @item = Item.find(params[:id])
    end
    
    def new

        @item = Item.new
        @genre = Genre.all
    end

    def create
        @item = Item.new(item_params)
         if @item.save
         redirect_to admin_item_path(@item)
    else
      render 'new'
    end
  end

    def show
        @item = Item.find(params[:id])
    end

  def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to admin_item_path(@item.id)
  end

  def edit
      @item = Item.find_by(params[:id])
      @genres = Genre.all
  end

  private

  def item_params
      params.require(:item).permit(:image, :name, :introduction, :net_price, :status, :genre_id)
  end


end
