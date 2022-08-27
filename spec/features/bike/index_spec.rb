require 'rails_helper'

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

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "/bikes"

      expect(page).to have_link('Shop Index', exact: true)

      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end
  end
end