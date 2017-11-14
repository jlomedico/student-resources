require 'rails_helper'

feature 'Visiting Secret Page' do

  it 'when not an admin, redirects to the root path' do
    user = User.create(name: 'John Doe', email: 'john@me.com', password: 'password', admin: false)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    visit secret_path
    expect(current_path).to eq (root_path)
  end

  it 'when an admin, shows them a secret' do
    user = User.create(name: 'Jane Grey', email:  'jane@me.com', password: 'password', admin: true)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    visit secret_path
    expect(page).to have_content("Secret")
    expect(current_path).to eq(secret_path)
  end
end
