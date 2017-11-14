require 'rails_helper'

describe "leaving a review for a baby sitter", :type => :feature do

  before :each do
    @babysitter = Babysitter.create(id: 1, first_name:'Stephanie', last_name: 'Acosta', city: "Miami", phone_number: "(305) 388-4000", rate: 20, sat_score: 1310)
    Babysitter.create(id: 2, first_name:'Michelle', last_name: 'Acosta', city: "Miami", phone_number: "(786) 232-7654", rate: 25, sat_score: 1350)
    Babysitter.create(id: 3, first_name:'Tiffany', last_name: 'Graham', city: "Toronto", phone_number: "(416) 666-1234", rate: 30, sat_score: 1340)

    @review = @babysitter.reviews.create(body: "testing", rating: 5)
  end

  #   As a parent
  # I want to visit babysater/1
  #           click "leave a review"
  #           fill in "review" with "She was awesome!"
  #           fill in "stars" with 5
  #           click "Submit Review"
  #           find "stephanie Acosta"
  #           find "She was awesome!"
  #           find "Average Rating: 5"
  # So that I can leave a review for my BabySATer

  it "a babysitter should have reviews" do
    expect(@review.babysitter).to be(@babysitter)
  end

  it "profile page should have 'leave a review' link" do
    visit '/babysitters/1'
    find_link('leave a review')
  end

  it "review form should be properly made to fit association" do
    visit '/babysitters/1'
    find_link('leave a review').click
  end

  it 'should have a body for review' do
    visit '/babysitters/1/reviews/new'
    fill_in 'Body', with: "She was awesome!"
  end

  it 'should have field for rating' do
    visit '/babysitters/1/reviews/new'
    fill_in 'Rating', with: '5'
  end

  it 'should have submit link/button to create a review' do
    visit '/babysitters/1/reviews/new'
    fill_in 'Body', with: "She was awesome!"
    fill_in 'Rating', with: '5'
    find("input[type=submit][value='Create Review']")
  end

  it 'profile page should have the average rating for babysitter as float' do
    visit '/babysitters/1/reviews/new'
    fill_in 'Body', with: "She was awesome!"
    fill_in 'Rating', with: '5'
    find("input[type=submit][value='Create Review']").click
    visit '/babysitters/1'
    expect(page).to have_content('Average Rating: 5.0')
  end

  it 'profile page should show review for babysitter' do
    visit '/babysitters/1/reviews/new'
    fill_in 'Body', with: "She was awesome!"
    fill_in 'Rating', with: '5'
    find("input[type=submit][value='Create Review']").click
    visit '/babysitters/1'
    expect(page).to have_content('She was awesome!')
    expect(page).to have_content('5')
  end

  it 'profile page should have babysitters full name' do
    visit '/babysitters/1'
    expect(page).to have_content('Stephanie')
    expect(page).to have_content('Acosta')
  end
end
