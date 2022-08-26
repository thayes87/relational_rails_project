require 'rails_helper'
# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
RSpec.describe Bike, type: :feature do
  describe 'As a visitor when I visit /child_table_name' do
    it 'Then I see each Child in the system including the Child\'s attributes' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: shop1.id})   
      
      visit "/bikes"
      
      expect(page).to have_content(bike1.brand)
      expect(page).to have_content(bike1.frame_size)
      expect(page).to have_content(bike1.demo_available)
      expect(page).to have_content(bike2.brand)
      expect(page).to have_content(bike2.frame_size)
      expect(page).to have_content(bike2.demo_available)
    end
  end
end