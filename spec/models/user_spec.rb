require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  describe 'Create a new use with valid parameters' do
    it 'when create a new user' do
      expect(@user).to be_valid
    end
  end
end
