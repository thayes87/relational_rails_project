require 'rails_helper'

RSpec.describe 'the cycle_shop show page' do
  describe 'As a visitor when I visit /parents/:id' do
    it 'shows specific parent attributes' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      shop2 = CycleShop.create!({name: "Subculture Cyclery", rental_program: false, bike_capacity: 104})
      
      visit "cycle_shops/#{shop1.id}"

      expect(page).to have_content(shop1.name)
      expect(page).to have_content(shop1.bike_capacity)
      expect(page).to have_content(shop1.rental_program)
    end
  end

  describe 'the cycle_shop show page with bike count' do 
    describe 'As a visitor When I visit a parent\'s show page' do
      it 'shows a count of the number of children associated with this parent' do 
        shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
        bike1 = shop1.bikes.create!({brand: "Revel", frame_size: 19, demo_available: true})
        bike2 = shop1.bikes.create!({brand: "Why", frame_size: 17, demo_available: false})
        
        visit "cycle_shops/#{shop1.id}"

        expect(page).to have_content(shop1.name)
        expect(page).to have_content("Bikes Available: #{shop1.bikes.count}")
      end
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})

      visit "cycle_shops/#{shop1.id}"

      expect(page).to have_link('Bike Index', exact: true)

      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
      bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
      visit "cycle_shops/#{shop1.id}"
     
      expect(page).to have_link('Shop Index', exact: true)
      
      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end
  end
end