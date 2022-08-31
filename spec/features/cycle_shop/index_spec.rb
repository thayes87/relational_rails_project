require 'rails_helper'

RSpec.describe CycleShop, type: :feature do
  before(:each) do
    @shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98, created_at: 1.days.ago})
    @shop2 = CycleShop.create!({name: "Subculture Cyclery", rental_program: false, bike_capacity: 104, created_at: 3.day.ago})
    @bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
  end
  describe 'As a visitor when I visit /cycle_shops' do
    it 'shows the name of each parent record in the system' do
      #user story 1, Parent Index      
      visit "/cycle_shops"
  
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop2.name)
    end

    it 'see that records are ordered by most recently created first and next to each of the records I see when it was created' do
      #user story 6, Parent Index sorted by Most Recently Created
      visit "/cycle_shops"

      expect("Subculture").to appear_before("Wheat Ridge Cyclery", only_text: true)
      expect(page).to have_content(@shop1.created_at.strftime("%D"))
      expect(page).to have_content(@shop2.created_at.strftime("%D"))
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      #user story 8, Child Index Link
      visit "/cycle_shops"

      expect(page).to have_link('Bike Index', exact: true)
      
      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end

    it 'can update Parent from the Parent index page' do
      #user story 17, Parent Update From Parent Index Page
      visit '/cycle_shops'
      
      expect(page).to have_link('Edit', exact: true)
      
      first(:link, 'Edit').click

      expect(current_path).to eq("/cycle_shops/#{@shop2.id}/edit")
    end
  end
end
