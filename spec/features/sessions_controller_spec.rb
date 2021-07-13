require 'rails_helper'

RSpec.feature 'SessionsControllers', type: :feature do
  describe 'Log in', type: :feature do
    background do
      User.create(email: 'user@example.com', username: 'Mina')
    end
    scenario 'Log in with correct credentials' do
      visit '/sessions/new'
      within('form') do
        fill_in 'Username', with: 'Mina'
      end
      click_button 'Log In'
      expect(page).to have_content 'Log in successful!'
      click_link('Log Out')
      expect(page).to have_content 'Log out successful!'
    end
  end
end
