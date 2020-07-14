class CommentsController < ApplicationController
  require 'byebug'
  def index
    user = User.find_by(id: user_params[:user_id])
    artwork = Artwork.find_by(id: artwork_params[:artwork_id])
    if user
      comments = user.comments
    elsif artwork
      comments = artwork.comments
    end
    if comments
      render json: comments
    else
      render json: comments.errors.full_messages, status: :not_found
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unproccessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unproccessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
  def user_params
    params.permit(:user_id)
  end
  def artwork_params
    params.permit(:artwork_id)
  end
end