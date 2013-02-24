module UsersHelper
  
  $users = [{name: "Warren", user_id: 226939267}, {name: "Mike", user_id: 6230423}, {name: "John", user_id: 8387844}, {name: "Steevo", user_id: 27501165}, {name: "Tony", user_id: 2001065}]
  
  def lookup_images_for(user)
    
    data = Instagram.user_recent_media(@user[:user_id], {count: 60})

    # process and store image data
    images = {"none" => []}
    for image in data
      caption = image['caption'] ? image['caption']['text'] : ""
      image_data = {'url' => image['images']['low_resolution']['url'], 'caption' => caption}
      if image["tags"].empty?
       images["none"] << image_data
      else        
        for tag in image["tags"]
          unless images.has_key?(tag)
            images[tag] = []
          end       
          images[tag] << image_data
        end
      end
    end
    
    images
      
  end
  
  def extract_top_ten_hashtags(images)
    images.keys.sort_by{ |x| images[x].length }.reverse[0..9]    
  end
  
end
