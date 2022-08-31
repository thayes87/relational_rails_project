require 'rails_helper'

RSpec.describe Bike, type: :feature do
before(:each) do
  @shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
  @bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
  @bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: @shop1.id})
  @bike3 = Bike.create!({brand: "Reve;", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
end 
  describe 'As a visitor when I visit /cycle_shop/:id' do
    it 'I see the child with that id including the child\'s attributes:' do   
      #user story 4, Child Show
      visit "/bikes/#{@bike1.id}"
      
      expect(page).to have_content(@bike1.brand)
      expect(page).to have_content(@bike1.frame_size)
      expect(page).to have_content(@bike1.demo_available)
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      #user story 8, Child Index link  
      visit "/bikes/#{@bike1.id}"

      expect(page).to have_link('Bike Index', exact: true)

      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      ##user story 9, Parent Index Link
      visit "/bikes/#{@bike1.id}"

      expect(page).to have_link('Shop Index', exact: true)

      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end

    it 'I see a link to update that Child "Update Child"' do
      #user story 14, Child Update
      visit "/bikes/#{@bike3.id}"
      expect(page).to have_content("Reve;")
      click_link "Update Bike"
      expect(current_path).to eq("/bikes/#{@bike3.id}/edit")
      
      fill_in 'brand', with: "Revel"
      fill_in 'frame_size', with: 19
      fill_in 'demo_available', with: true
      
      click_button "Submit"

      expect(current_path).to eq("/bikes/#{@bike3.id}")
      expect(page).to have_content("Revel")
      expect(page).to_not have_content("Reve;")
    end

    it 'Then I see a link to delete the child' do
      #user story 20, Child Delete
      visit "/bikes/#{@bike1.id}"

      expect(page).to have_link('Delete Bike', exact: true)
      
      click_link('Delete Bike')
      
      expect(current_path).to eq('/bikes')
      expect(page).to_not have_content("Revel")
      expect(Bike.count).to eq(2)
    end
  end
end
