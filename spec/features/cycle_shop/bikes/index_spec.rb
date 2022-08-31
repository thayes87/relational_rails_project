require 'rails_helper'

RSpec.describe 'CycleShop Bikes index', type: :feature do
  before (:each) do
    @shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
    @shop2 = CycleShop.create!({name: "Subculture Cyclery", rental_program: false, bike_capacity: 104})
    @bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
    @bike2 = Bike.create!({brand: "Why", frame_size: 17, demo_available: false, cycle_shop_id: @shop1.id}) 
    @bike3 = Bike.create!({brand: "Commencal", frame_size: 19, demo_available: true, cycle_shop_id: @shop1.id})
    @bike4 = Bike.create!({brand: "Atherton", frame_size: 18, demo_available: true, cycle_shop_id: @shop1.id})
  end
  describe 'As a visitor when I visit cycle_shop/:id/bikes' do
    it 'Then I see each bike that is associated with that cycle_shop with each bikes attributes:' do
      #user story 5, Parent Children Index
      visit "/cycle_shop/#{@shop1.id}/bikes"

      expect(page).to have_content(@shop1.name)
      expect(page).to have_content(@bike1.brand)
      expect(page).to have_content(@bike1.demo_available)
      expect(page).to have_content(@bike1.frame_size)
      expect(page).to have_content(@bike2.brand)
      expect(page).to have_content(@bike2.demo_available)
      expect(page).to have_content(@bike2.frame_size)
    end

    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      #uesr story 8, Child Index
      visit "/cycle_shop/#{@shop1.id}/bikes"

      expect(page).to have_link('Bike Index', exact: true)
      
      click_link('Bike Index')

      expect(current_path).to eq('/bikes')
    end
    
    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      #user story 9, Parent Index Link
      visit "/cycle_shop/#{@shop1.id}/bikes"

      expect(page).to have_link('Shop Index', exact: true)
      
      click_link('Shop Index')

      expect(current_path).to eq('/cycle_shops')
    end

    it 'Then I see a link to add a new adoptable child for that parent "Create Child"' do
      #user story 13, Parent Child Creation 
      visit "/cycle_shop/#{@shop1.id}/bikes"
      
      expect(page).to have_link('Create Bike', exact: true)

      click_link('Create Bike')
      expect(current_path).to eq("/cycle_shop/#{@shop1.id}/bikes/new")

      fill_in('Brand', with: 'Seven')
      fill_in('Frame size', with: 17)
      fill_in('Demo available', with: false)
      click_button('Submit')

      expect(current_path).to eq("/cycle_shop/#{@shop1.id}/bikes")
      expect(page).to have_content('Seven')
    end

    it 'Then I see a link to sort children in alphabetical order' do 
      #user story 16, Sort Parent's Children in Alphabetical Order by name
      visit "/cycle_shop/#{@shop1.id}/bikes"
      expect(page).to have_link('Sort Bikes Alphabetically', exact: true)

      click_link('Sort Bikes Alphabetically')
      expect(current_path).to eq("/cycle_shop/#{@shop1.id}/bikes")
      expect("Atherton").to appear_before("Commencal", only_text: true)
      expect("Commencal").to appear_before("Revel", only_text: true)
      expect("Revel").to appear_before("Why", only_text: true)
    end
    
    it 'can update child from the parents child index page' do
      #user story 18, Child update from Parents Child Index Page
      visit "/cycle_shop/#{@shop1.id}/bikes"

      expect(page).to have_link('Edit', exact: true)
      
      first(:link, 'Edit').click
      expect(current_path).to eq("/bikes/#{@bike1.id}/edit")
    end
  end
end