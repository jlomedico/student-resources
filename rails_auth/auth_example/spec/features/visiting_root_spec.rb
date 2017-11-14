require 'rails_helper'

feature 'Visting Root' do

  it 'when not logged in redirects to a registration page' do
    visit root_path
    expect(current_path).to eq('/register')
  end

  it 'when logged in shows a welcome message' do
    user = User.create(name: 'John Doe', email: 'john@me.com', password: 'password')
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome')
  end
end
