require 'rails_helper'

RSpec.describe Bike, type: :feature do
  describe 'As a visitor when I visit /child_table_name' do
    it 'Then I see each Child in the system including the Child\'s attributes' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: true, cycle_shop_id: shop1.id})   
      
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

    it 'Then I only see records where the boolean column is `true`' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: shop1.id})
      bike3 = Bike.create!({brand: "Seven", frame_size: 17, demo_available: false, cycle_shop_id: shop1.id})
      bike4 = Bike.create!({brand: "Commencal", frame_size: 15, demo_available: true, cycle_shop_id: shop1.id})

      visit "/bikes"

      expect(page).to have_content('Revel')
      expect(page).to_not have_content('Why')
      expect(page).to_not have_content('Seven')
      expect(page).to have_content('Commencal')
    end

    it 'can update child from the childs index page' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: true, cycle_shop_id: shop1.id})
      bike3 = Bike.create!({brand: "Seven", frame_size: 17, demo_available: true, cycle_shop_id: shop1.id})
      bike4 = Bike.create!({brand: "Commencal", frame_size: 15, demo_available: true, cycle_shop_id: shop1.id})

      visit "/bikes"

      expect(page).to have_link('Edit', exact: true)
      
      first(:link, 'Edit').click
      expect(current_path).to eq("/bikes/#{bike1.id}/edit")
    end
  end
end