class AlbumsController < ApplicationController

  def new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @tracks = @album.tracks
    render :show
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    # params[:year] = params[:year].to_i
    params.require(:album).permit(:title, :date, :live, :band_id)
  end

end
