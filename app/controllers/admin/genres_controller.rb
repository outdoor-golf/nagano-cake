class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    new_genre = Genre.new(genre_params)
    if Genre.find_by(name: new_genre.name)
      redirect_to  new_admin_genre_path,notice:'既に存在しています'
    else
     new_genre.save
     redirect_to  new_admin_genre_path,notice:'ジャンル追加しました'
    end
  end
  def edit
    @genre = Genre.find(params[:id])
  end
  def update
    genre = Genre.find(params[:id])
    if Genre.find_by(name: genre.name)
      redirect_to new_admin_genre_path,notice:'既に存在しています'
    else
      genre.update(genre_params)
      redirect_to new_admin_genre_path,notice:'変更しました'
    end
  end


  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
