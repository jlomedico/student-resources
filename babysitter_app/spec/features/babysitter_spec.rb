require 'rails_helper'

describe "to create a babysitter", :type => :feature do

# As a babysitter,
# I want to visit homepage,
#           click "Become a BabySATer"
#           find "Join x BabySATers and counting!" (should be live number)
#           fill in first name with "Stephanie",
#           fill in last name with "Acosta",
#           fill in city with "Miami",
#           fill in phone number with "(305) 388-4000",
#           fill in rate with "20",
#           click "Let's go!",
#           find "You need to enter your SAT score!"
#           fill in "SAT Score" with "1310"
#           click "Let's go!"
#           find "Welcome, Stephanie!"
# So that I can get contacted by potential clients.
  context 'home and new babysitter page' do
    let(:visit_homepage) do
      visit '/'
    end

    let(:visit_new_babysitter_page) do
      visit '/babysitters/new'
    end

    it 'I should be able to visit the homepage and see link for becoming a babysatter' do
      visit_homepage
      expect(page).to have_content('Become a BabySATter')
      find_link('Become a BabySATter').click
    end

    it 'should have live count of current babysitters' do
      visit_new_babysitter_page
      expect(page).to have_content('Join 0 BabySATters and counting!')
    end
  end

  context 'creating a new babysitter' do
    let(:fill_out_babysitter_form) do
      visit('/babysitters/new')
      fill_in 'First name', with: "Stephanie"
      fill_in 'Last name', with: "Acosta"
      fill_in 'City', with: "Miami"
      fill_in 'Phone number', with: "(305) 388-4000"
      fill_in 'Rate', with: "20"
      click_button("Create Babysitter")
    end

    it 'should validate that sat score was entered in form' do
      fill_out_babysitter_form
      expect(page).to have_content('You need to enter your SAT score!')
    end

    it 'should see welcome message only after creating account' do
      fill_out_babysitter_form
      fill_in 'Sat score', with: "1310"
      click_button("Create Babysitter")
      expect(page).to have_content('Welcome, Stephanie!')
    end
  end

end
