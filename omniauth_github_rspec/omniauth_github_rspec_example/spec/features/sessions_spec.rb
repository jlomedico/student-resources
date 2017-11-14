require 'rails_helper'

RSpec.feature "sessions", type: :feature do
  before do
    visit root_path
  end

  describe "github login" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:github, {:uid => '12345', info: {name: 'Github User Name'}})
    end

    it "creates a new user" do
      expect {
        click_link "Sign in with Github"
        ["Signed in!", "Sign Out", "Github User Name"].each do |text|
          expect(page).to have_content text
        end
      }.to change { User.count }.by 1
    end

    it "logs out" do
      click_link "Sign in with Github"
      click_link "Sign Out"
      ["Signed out!", "You are not logged in", "Sign in with Github"].each do |text|
        expect(page).to have_content text
      end
    end

    it "doesn't create a new user on the second login" do
      click_link "Sign in with Github"
      click_link "Sign Out"
      expect {
        click_link "Sign in with Github"
      }.to_not change { User.count }
    end
  end
end
