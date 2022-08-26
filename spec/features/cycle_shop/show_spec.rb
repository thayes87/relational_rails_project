require 'rails_helper'

# User Story 2, Parent Show

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
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
end