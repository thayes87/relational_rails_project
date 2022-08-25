require 'rails_helper'

RSpec.describe CycleShop, type: :feature do
  describe 'As a visitor when I visit /parents' do
    it 'Then I see the name of each parent record in the system' do
      shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery"})
      shop2 = CycleShop.create!({name: "Subculture Cyclery"})
      
      visit "/cycle_shops"
      
      expect(page).to have_content(shop1.name)
      expect(page).to have_content(shop2.name)
    end
  end
end