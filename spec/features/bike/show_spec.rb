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
      
      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "/bikes/#{bike1.id}"

      expect(page).to have_link('Shop Index', exact: true)

      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end

    it 'I see a link to update that Child "Update Child"' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Reve", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})

      visit "/bikes/#{bike1.id}"
      expect(page).to have_content("Reve")

      click_link "Update Bike"
      expect(current_path).to eq("/bikes/#{bike1.id}/edit")
      
      fill_in 'brand', with: "Revel"
      fill_in 'frame_size', with: 19
      fill_in 'demo_available', with: true

      click_button "Submit"
      expect(current_path).to eq("/bikes/#{bike1.id}")
    end

    it 'Then I see a link to delete the parent' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "/bikes/#{bike1.id}"

      expect(page).to have_link('Delete Bike', exact: true)
      
      click_link('Delete Bike')
      expect(current_path).to eq('/bikes')
      expect(page).to_not have_content("Revel")
      expect(Bike.count).to eq(1)
    end
  end
end