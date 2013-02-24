require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do
    before { visit about_path }

    it { should have_selector('p',    text: 'demo') }
  end

end
