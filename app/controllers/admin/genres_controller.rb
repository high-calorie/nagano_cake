class Admin::GenresController < ApplicationController
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to request.referer
    else
      render :new
    end
  end

end
