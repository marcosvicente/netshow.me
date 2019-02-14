require 'rails_helper'

RSpec.describe View, type: :model do
 before(:each) do
    @view = create(:view)
  end

  before 'Create a new View' do
    it 'has be valid' do
      expect(@view).to be_valid
    end

    it 'has save a new View' do
      expect(View.count).to eq(1)
    end
  end

end
