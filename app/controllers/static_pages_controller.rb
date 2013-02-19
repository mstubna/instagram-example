class StaticPagesController < ApplicationController

  $users = [{name: "Warren", user_id: 226939267}, {name: "Mike", user_id: 6230423}, {name: "John", user_id: 8387844}, {name: "Steevo", user_id: 27501165}, {name: "Tony", user_id: 2001065}]
  
  def home
    @users = $users
  end
    
  def user
    @user = $users.select{ |u| u[:name] == params['name'] }.first
  
    data = Instagram.user_recent_media(@user[:user_id], {count: 60})    

    # process and store image data
    @images = {"none" => []}
    for image in data
      caption = if image['caption'] then image['caption']['text'] else "" end
      image_data = {'url' => image['images']['low_resolution']['url'], 'caption' => caption}
      if image["tags"].empty?
       @images["none"] << image_data
      else        
        for tag in image["tags"]
          unless @images.has_key?(tag)
            @images[tag] = []
          end       
          @images[tag] << image_data
        end
      end
    end

    @images_hashtags = @images.keys.sort_by{ |x| @images[x].length }.reverse[0..9]
     
  end
  
end
