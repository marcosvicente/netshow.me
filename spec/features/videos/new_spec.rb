require 'rails_helper'

RSpec.feature "Video #new", type: :feature do
  describe "User create a new video" do
    before(:each) do
      @user = create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
    end

    it "when have valid attributes" do
      visit "/videos/new"

      fill_in "Name", :with => Faker::Name.name
      fill_in "Url", :with => 'm3.m3u8'

      click_button("Create Video")

      expect(page).to have_content("Video was successfully created.")
    end

    it "when have invalid url" do
      visit "/videos/new"

      fill_in "Name", :with => Faker::Name.name
      fill_in "Url", :with => 'm3.m3u'

      click_button("Create Video")

      expect(page).to have_content("Url Type of video is not valid")
    end
  end
end
