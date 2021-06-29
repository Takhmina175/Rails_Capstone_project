require 'rails_helper' 

RSpec.feature 'UsersControllers', type: :feature do
  context 'register new user' do

  describe "the signup process", type: :feature do
    it "Register" do
        visit new_user_path
        within('form') do
        fill_in 'Username', with: 'Mina'
        fill_in 'Email', with: 'user@example.com'  
        end
        click_button 'Submit'
        expect(page).to have_content 'Successfully registered'
    end
   end
   
  end
end