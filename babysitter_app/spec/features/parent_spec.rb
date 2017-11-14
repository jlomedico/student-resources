require 'rails_helper'

describe "nagivating baby sitters", :type => :feature do
  before :all do
    @babysitter = Babysitter.create(id: 1, first_name:'Stephanie', last_name: 'Acosta', city: "Miami", phone_number: "(305) 388-4000", rate: 20, sat_score: 1310)
    Babysitter.create(id: 2, first_name:'Michelle', last_name: 'Acosta', city: "Miami", phone_number: "(786) 232-7654", rate: 25, sat_score: 1350)
    Babysitter.create(id: 3, first_name:'Tiffany', last_name: 'Graham', city: "Toronto", phone_number: "(416) 666-1234", rate: 30, sat_score: 1340)
  end


    # As a parent
    # I want to visit homepage
    #           find "Find a babysitter who will prepare your toddler for their future SAT exams!"
    #           find "Our BabySATers:"
    #           find "Stephanie Acosta"
    #           find "1310"
    #           find "$20/hr"
    #           click "Stephanie Acosta"
    #           find "(305) 388-4000"
    #           find "Other BabySATers in Miami:"
    #           find name, score, rate "$X/hr" of other Miami BabySATers
    # So that I can book a BabySATer

  it 'should find link to view all babysitters on home page' do
    visit '/'
    expect(page).to have_content('Find a babySATter')
    find_link('Find a babySATter').click
  end

  context 'all babysitters' do
    before :each do
      visit '/babysitters'
    end

    it 'should see headline/description on babysitter index page' do
      expect(page).to have_content('Find a babysitter who will prepare your toddler for their future SAT exams!')
    end

    it 'list of babysitters includes each babysitters full name' do
      expect(page).to have_content('Our BabySATters:')
      expect(page).to have_content('Stephanie Acosta')
    end

    it 'list of babysitters includes babysitter rate in proper format' do
      expect(page).to have_content('$20/hr')
    end

    it 'list of babysitters includes babysitter SAT score' do
      expect(page).to have_content('1310')
    end

    it 'babysitters name on index page should be a clickable link' do
      find_link("Stephanie Acosta").click
    end
  end

  context 'a babysitters profile' do
    before :each do
      visit 'babysitters/1'
    end

    it 'babysitters profile should include full name' do
      expect(page).to have_content('Stephanie Acosta')
    end

    it 'babysitters profile should include phone number' do
      expect(page).to have_content('(305) 388-4000')
    end

    it 'profile should include list of babysitters whom share to same city as current babysitter' do
      expect(page).to have_content('Other BabySATers in Miami:')
      expect(page).to have_content('Michelle')
    end

    it 'should not include babysitters from other cities' do
      expect(page).to_not have_content('Tiffany')
    end

    it 'should see the local babysitters first name, SAT score, and rate in proper format' do
      expect(page).to have_content('Michelle')
      expect(page).to have_content('1350')
      expect(page).to have_content('$25/hr')
    end
  end

end
