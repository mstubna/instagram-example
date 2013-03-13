class UsersController < ApplicationController
  include UsersHelper
    
  def index
    @users = $users
  end
    
  def show
    @user = $users.select{ |u| u[:name] == params[:id] }.first
    @images = extract_images_from_data(lookup_image_data_for(@user))
    @images_hashtags = extract_top_ten_hashtags(@images)
  end
  
end