class UsersController < ApplicationController
require 'byebug'
  def index
    if query_params.empty?
      users = User.all
    else
      users = User.where('users.username LIKE ?',  "%#{query_params[:username]}%")
    end
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :not_found
    end
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.require(:user).permit(:username)
  end
  def query_params
    params.permit(:username)
  end
end