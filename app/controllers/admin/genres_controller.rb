class Admin::GenresController < ApplicationController

    
    def index
        @genres = Genre.all
    end
        
    
    def create
        @genre = Genre.new
        if @genre.save
           flash[:notice] = "ジャンルを追加しました"
           redirect_to admin_genres_path
        else
          @genres = Genre.all
          render :index 
        end
    end
    
    
    def edit
    
  　end
    
private
    
    def genre_params
    params.require(:genre).permit(:genre_name)
  
    end




    end

end
