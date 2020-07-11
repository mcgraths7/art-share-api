class ArtworksController < ApplicationController
  def index
    user = User.find_by(id: user_params[:user_id])
    submitted_artworks = user.artworks
    shared_artworks = user.shared_artworks
    artworks = submitted_artworks + shared_artworks
    if artworks
      render json: artworks
    else
      render json: artworks.errors.full_messages, status: :not_found
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :not_found
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.update!(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork.destroy!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def user_params
    params.permit(:user_id)
  end
end