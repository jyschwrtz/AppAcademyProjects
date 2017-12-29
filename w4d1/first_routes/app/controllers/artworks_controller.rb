class ArtworksController < ApplicationController

  def index
    # @shared_viewers
    # @artworks = Artwork.where(shared_viewers: params[:user_id])
    #                   .where(artist_id: params[:user_id])
    @artworks = User.find_by(id: params[:user_id]).artworks
    @shared_artworks = User.find_by(id: params[:user_id]).shared_artworks
    # @artworks = @artworks + @shared_artworks
    render json: @artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    if artwork = Artwork.find_by(id: params[:id])
      render json: artwork
    else
      render plain: "Can't find artwork"
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork.destroy
      render json: artwork
    else
      render plain: "Can't find artwork"
    end
  end


  private

  def artwork_params
    params[:artwork].permit(:title, :image_url, :artist_id)
  end

end
