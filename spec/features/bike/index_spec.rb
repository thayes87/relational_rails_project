require 'rails_helper'

RSpec.describe Bike, type: :feature do
  before(:each) do 
    @shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
    @bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
    @bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: @shop1.id})
    @bike3 = Bike.create!({brand: "Seven", frame_size: 17, demo_available: false, cycle_shop_id: @shop1.id})
    @bike4 = Bike.create!({brand: "Commencal", frame_size: 15, demo_available: true, cycle_shop_id: @shop1.id})
  end
  
  describe 'As a visitor when I visit /bikes' do
    it 'shows each Child in the system including the Child\'s attributes' do
      #user story 3, Child Index, overwritten by story 15
      visit "/bikes"
      
      expect(page).to have_content(@bike1.brand)
      expect(page).to have_content(@bike1.frame_size)
      expect(page).to have_content(@bike1.demo_available)
      expect(page).to have_content(@bike4.brand)
      expect(page).to have_content(@bike4.frame_size)
      expect(page).to have_content(@bike4.demo_available)
    end

    it 'has link at the top of the page that takes me to the Parent Index' do    
      #user story 9, Parent Index Link
      visit "/bikes"

      expect(page).to have_link('Shop Index', exact: true)

      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end

    it 'only shows records where the boolean column is `true`' do
      #user story 15, Child Index only show 'true' Records
      visit "/bikes"

      expect(page).to have_content('Revel')
      expect(page).to_not have_content('Why')
      expect(page).to_not have_content('Seven')
      expect(page).to have_content('Commencal')
    end

    it 'can update child from the childs index page' do
      #user story 18, Child Update from Childs Index Page 
      visit "/bikes"

      expect(page).to have_link('Edit', exact: true)
      
      first(:link, 'Edit').click
      expect(current_path).to eq("/bikes/#{@bike1.id}/edit")
    end
  end
end
