require 'spec_helper'

describe 'UsersHelper' do
    
  describe "list of users" do    
    it "should be a non-empty array" do
      $users.should_not be nil
      $users.class.should be Array
    end
    it "should have length 5" do 
      $users.length.should be 5
    end
  end
  
  # stub helper so it doesn't hit the Instragram API during testing
  before(:each) do
    helper.stub(:lookup_image_data_for) do |arg|
      serialized = File.read("data/test_instagram_data.txt")
      data = JSON.parse(serialized)["data"]
    end
  end
      
  let(:images) { helper.extract_images_from_data(helper.lookup_image_data_for($users.first)) }
    
  describe "lookup_images_for" do    
    it "should return a hash of image data" do
      images.should_not be nil
      images.class.should be Hash
    end
  end
  
  let(:ht) { helper.extract_top_ten_hashtags(images) }
  
  describe "extract_top_ten_hashtags" do
    it "should return an array of at most 10 hashtags" do
      ht.should_not be nil
      ht.class.should be Array
      ht.length.should <= 10
    end
  end
      
end
