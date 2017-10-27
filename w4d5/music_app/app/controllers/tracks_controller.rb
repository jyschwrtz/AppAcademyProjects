class TracksController < ApplicationController

  def new
    @album = Album.find_by(id: params[:album_id])
    @band = @album.band
    @albums = @band.albums
    render :new
  end

  def create
    @track = Track.new(track_params)
    @album = @track.album
    @band = @album.band
    @albums = @band.albums
    if @track.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :lyrics, :album_id)
  end
end
