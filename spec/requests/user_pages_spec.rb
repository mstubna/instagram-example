require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Index page" do
    before { visit root_path }
    
    describe "should have a list of users" do
      it { should have_selector('div.users_list') }
    end
    
    describe "should have a link for each user pointing to their profile page" do
      for user in $users
        it { should have_link(user[:name], href: user_path(user[:name])) }
      end
    end
  end
  
  # stub controller so it doesn't hit the Instragram API during testing
  before(:each) do
    UsersController.any_instance.stub(:lookup_image_data_for) do |arg|
      serialized = File.read("data/test_instagram_data.txt")
      data = JSON.parse(serialized)["data"]
    end
  end
  
  describe "Show page" do
    for user in $users
      
      before { visit user_path(user[:name]) }
                  
      describe "should have a list of hashtags" do
        it { should have_selector('div#hashes') }
      end
  
      describe "should have a list of buttons corresponding to the user's tags" do
        for ht in ['none', 'lqccrazytrain', 'holyquartet']
          it { should have_selector("div.#{ht}") }          
        end
      end
    end
  end
  
end
