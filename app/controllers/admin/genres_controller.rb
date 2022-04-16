class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    new_genre = Genre.new(genre_params)
    unless Genre.find_by(name: new_genre.name)
      new_genre.save
    end
    redirect_to new_genre_path
  end


  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
