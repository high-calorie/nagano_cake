class Admin::GenresController < ApplicationController
  def edit
  @genre = Genre.find(params[:id])
  end

  def update
  @genre = Genre.find(params[:id])
  if @genre.update(admin_params)
  redirect_to request.referer
  else
  render :new
  end
  end

  def destroy
  @genre = Genre.find(params[:id])
  @genre.destroy
  redirect_to request.referer
  end

end
