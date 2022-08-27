require 'rails_helper'

RSpec.describe 'CycleShop Bikes index', type: :feature do
  describe 'As a visitor when I visit /parents/:parent_id/child_table_name' do
    it 'Then I see each Child that is associated with that Parent with each Child\'s attributes:' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      shop2 = CycleShop.create!({name: "Subculture Cyclery", rental_program: false, bike_capacity: 104})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: shop1.id})   

      visit "/cycle_shop/#{shop1.id}/bikes"

      expect(page).to have_content(shop1.name)
      expect(page).to have_content(bike1.brand)
      expect(page).to have_content(bike1.demo_available)
      expect(page).to have_content(bike1.frame_size)
      expect(page).to have_content(bike2.brand)
      expect(page).to have_content(bike2.demo_available)
      expect(page).to have_content(bike2.frame_size)
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "/cycle_shop/#{shop1.id}/bikes"

      expect(page).to have_link('Bike Index', exact: true)
    end
  end
end