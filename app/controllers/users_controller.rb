class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
    
  def index
    users = User.all
    json_response(users)
  end

  def show
    user = User.find(params[:id])
    json_response(user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@todo, :created)
  end

   def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    user_params = params[:user].permit :username, :email, :password
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end