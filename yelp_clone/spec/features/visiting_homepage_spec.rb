require 'rails_helper'

feature 'Visting the Homepage' do
  before do
    visit root_path
  end

  it 'displays a login form'
  it 'displays a registration form'
end
