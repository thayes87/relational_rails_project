require 'rails_helper'
# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:
RSpec.describe Bike, type: :feature do
  describe 'As a visitor when I visit /child_table_name/:id' do
    it 'Then I see the child with that id including the child\'s attributes:' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: shop1.id})   
      
      visit "/bikes/#{bike1.id}"
      
      expect(page).to have_content(bike1.brand)
      expect(page).to have_content(bike1.frame_size)
      expect(page).to have_content(bike1.demo_available)
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "/bikes/#{bike1.id}"

      expect(page).to have_link('Bike Index', exact: true)
    end
  end
end