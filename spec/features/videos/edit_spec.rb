require 'rails_helper'

RSpec.feature "Video #edit", type: :feature do
  describe "User create a new video" do
    before(:each) do

      @video = create(:video)
      login_as(@video.user, :scope => :user, :run_callbacks => false)

    end

    it "when have valid attributes" do
      visit "/videos/#{@video.id}/edit"

      fill_in "Name", :with => Faker::Name.name
      fill_in "Url", :with => 'm3.m3u8'

      click_button("Update Video")

      expect(page).to have_content("Video was successfully updated.")
    end

    it "when have invalid url" do
      visit "/videos/#{@video.id}/edit"

      fill_in "Name", :with => Faker::Name.name
      fill_in "Url", :with => 'm3.m3u'

      click_button("Update Video")

      expect(page).to have_content("Url Type of video is not valid")
    end
  end
end
