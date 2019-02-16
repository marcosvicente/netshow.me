require 'rails_helper'
RSpec.describe VideosController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user

    @video = create(:video)
    @video_attributes = attributes_for(:video)
    @video_invalid = attributes_for(:video, name: 1, url: 1, view_id: 'sd')

  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @video.to_param}
      expect(response).to be_successful
    end

    it "has increment value of view" do
      value = @video.view.count
      get :show, params: {id: @video.to_param}
      expect(@video.view.count).to eq(value)
    end

  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @video.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        post :create, params: {video: @video_attributes}
      end

      it "creates a new Video" do
        expect{
          post :create, params: { video: @video_attributes}
        }.to change(Video,:count).by(1)
      end

      it 'creates a new View' do
        expect{
          post :create, params: { video: @video_attributes}
        }.to change(View,:count).by(1)
      end

      it "redirects to the created video" do
        expect(response).to redirect_to(assigns(:video))
      end

      it "has save view with value 0" do
        expect(@video.view.count).to eq(0)
      end

    end

    context "with invalid params" do
      before(:each) do
        post :create, params: {video: @video_invalid}
      end

      it "returns a success response" do
        expect(response).to be_successful
      end

      it "redirects to the created video" do
        expect(response).to render_template(:new)
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested video" do
        put :update, params: { id: @video.to_param, video: @video_attributes }
        @video.reload
        @video_new = Video.last
        expect(@video_new.name).to eq(Video.name)
      end

      it "redirects to the video" do
        put :update, params: {id: @video.to_param, video: @video_attributes}
        expect(response).to redirect_to(@video)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        put :update, params: {id: @video.to_param, video: @video_invalid}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested video" do
      expect {
        delete :destroy, params: {id: @video.to_param}
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the videos list" do
      delete :destroy, params: {id: @video.to_param}
      expect(response).to redirect_to(videos_url)
    end

  end

  describe 'GET #view' do
    it 'has update view' do
      v = @video.view.count 

      get "/videos/#{@video.id}/view"

      @video.view.reload

      expect(@video.view.count).to eq(v + 1)
    end
  end


end
