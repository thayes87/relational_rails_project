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
#   User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
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
  end
end