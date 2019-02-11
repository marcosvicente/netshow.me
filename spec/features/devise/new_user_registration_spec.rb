require 'rails_helper'

RSpec.feature "Devise::NewUserRegistrations", type: :feature do
  describe "Has login process", type: :feature do
    before :each do
      @user = build(:user)
    end

    it "login in" do
      visit '/users/sign_up'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully')
    end

  end

  describe 'have a link' do
    it 'has log in link' do
      visit 'users/sign_up'
      expect(page).to have_link('Log in')
    end

  end

  describe 'when click in link' do
    it 'Sign up link' do
      visit 'users/sign_up'
      click_link('Log in')
      expect(page).to have_current_path(new_user_session_path)
    end

  end

end
