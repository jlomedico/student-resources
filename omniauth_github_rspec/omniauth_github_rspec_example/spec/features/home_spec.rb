require 'rails_helper'

RSpec.feature "homepage", type: :feature do
  it "loads successfully" do
    visit root_path
    expect(page).to have_http_status(:success)
  end
end
