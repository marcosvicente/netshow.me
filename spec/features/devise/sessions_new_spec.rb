require 'rails_helper'

RSpec.feature "Devise::SessionsNews", type: :feature do
  describe "Has login process", type: :feature do
    before :each do
      @user = create(:user)
    end

    it "login in" do
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
  end

  describe 'have a link' do
    it 'has sign_up link' do
      visit 'users/sign_in'
      expect(page).to have_link('Sign up')
    end

    it 'has Forgot your password? link' do
      visit 'users/sign_in'
      expect(page).to have_link('Forgot your password?')
    end

  end

  describe 'when click in link' do
    it 'Sign up link' do
      visit 'users/sign_in'
      click_link('Sign up')
      expect(page).to have_current_path(new_user_registration_path)
    end

    it 'Forgot your password? link' do
      visit 'users/sign_in'
      click_link('Forgot your password?')
      expect(page).to have_current_path(new_user_password_path)
    end

  end
end
