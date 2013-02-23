class UsersController < ApplicationController
  include UsersHelper
    
  def index
    @users = $users
  end
    
  def show
    @user = $users.select{ |u| u[:name] == params[:id] }.first
    lookup_images_for(@user)
  end
  
end