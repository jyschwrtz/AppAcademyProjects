require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit(new_user_url)
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit(new_user_url)
      fill_in('Username', with: 'Jeff')
      fill_in('Password', with: 'password')
      click_button('Sign Up')
      expect(page).to have_content('Jeff')
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
