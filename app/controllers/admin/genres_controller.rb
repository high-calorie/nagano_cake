class Admin::GenresController < ApplicationController
<<<<<<< HEAD
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
=======

    
    def index
        @genre = Genre.new
        @genres = Genre.all
    end
        
    
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
           flash[:notice] = "ジャンルを追加しました"
           redirect_to admin_genres_path
        else
          @genres = Genre.all
          render :index 
        end
    end
    
private
    
    def genre_params
    params.require(:genre).permit(:genre_name)
  
    end




    
>>>>>>> cd3a2554e8acd31ed6d334b189c2b30ad9ad9a8b

end
