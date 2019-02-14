require 'rails_helper'

RSpec.describe "Videos", type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end
  describe "GET /videos" do
    it "has http 200" do
      get videos_path
      expect(response).to have_http_status(200)
    end
  end
end
