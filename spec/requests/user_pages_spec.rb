require 'spec_helper'
include UsersHelper

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
  
  describe "Show page" do
    for user in $users
      before { visit user_path(user[:name]) }
      
      describe "should have a list of hashtags" do
        it { should have_selector('div#hashes') }
      end
      
      describe "should have a list of buttons corresponding to the user's tags" do
        for ht in extract_top_ten_hashtags(lookup_images_for(user))
          it { should have_selector("div.#{ht}") }
        end
      end      
    end
  end

end
