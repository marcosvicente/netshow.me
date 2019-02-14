require 'rails_helper'

RSpec.describe Video, type: :model do
  before(:each) do
    @video = create(:video)
    @video_invalid = build(:video, url: 'aa.mp4')
  end

  describe 'Create a new Video' do
    it 'has valid?' do
      expect(@video).to be_valid
    end

    it 'has not valid?' do
      expect(@video_invalid).to_not be_valid
    end

    it 'has save a new Video' do
      expect(Video.count).to eq(1)
    end
  end

  describe 'Has validations' do
    before { allow(subject).to receive(:type_of_video).and_return(false) }

    it { is_expected.to belong_to(:view) }

    it { is_expected.to validate_presence_of(:name).on(:create) }
    it { is_expected.to validate_presence_of(:url).on(:create)}

  end
end
