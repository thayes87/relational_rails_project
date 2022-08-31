require 'rails_helper'

RSpec.describe 'the cycle_shop show page' do
  before(:each) do
    @shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
    @shop2 = CycleShop.create!({name: "Subculture Cyclery", rental_program: false, bike_capacity: 104})
    @bike1 = @shop1.bikes.create!({brand: "Revel", frame_size: 19, demo_available: true})
    @bike2 = @shop1.bikes.create!({brand: "Why", frame_size: 17, demo_available: false})
  end
  describe 'As a visitor when I visit /parents/:id' do
    it 'shows specific parent attributes' do
      #user story 2, Parent Show
      visit "cycle_shops/#{@shop1.id}"

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@shop1.bike_capacity)
      expect(page).to have_content(@shop1.rental_program)
    end

    it 'shows a count of the number of children associated with this parent' do 
      #user story 7, Parent Child Count
      visit "cycle_shops/#{@shop1.id}"
  
      expect(page).to have_content(@shop1.name)
      expect(page).to have_content("Bikes Available: #{@shop1.bikes.count}")
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      #User Story 8, Child Index Link
      visit "cycle_shops/#{@shop1.id}"

      expect(page).to have_link('Bike Index', exact: true)

      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      #User Story 9, Parent Index Link
      visit "cycle_shops/#{@shop1.id}"
     
      expect(page).to have_link('Shop Index', exact: true)
      
      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end

    it 'Then I see a link to take me to that cycle_shops bikes page' do
      #user story 10, Parent Index Link
      visit "cycle_shops/#{@shop1.id}"

      expect(page).to have_link('Cycle Shop Bikes', exact: true)

      click_link('Cycle Shop Bikes')

      expect(current_path).to eq("/cycle_shop/#{@shop1.id}/bikes")
    end

    it 'Then I see a link to delete the parent' do
      #user story 19, Parent Delete
      visit "cycle_shops/#{@shop1.id}"

      expect(page).to have_link('Delete Cycle Shop', exact: true)
      
      click_link('Delete Cycle Shop')
      expect(current_path).to eq('/cycle_shops')
      expect(page).to_not have_content("Wheat Ridge Cyclery")
      expect(CycleShop.count).to eq(1)
      expect(Bike.count).to eq(0)
    end
  end
end
