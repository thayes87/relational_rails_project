# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'the cycle_shop creation' do
  it 'links to the new page from the cycle_shop index' do
    shop1 = CycleShop.create!({name: "Wheat Ridge Cyclery", rental_program: true, bike_capacity: 98})
    bike1 = Bike.create!({brand: "Revel", frame_size: 19, demo_available: true, cycle_shop_id: shop1.id})
      
    visit '/cycle_shops'

    click_link('New Cycle Shop')
    expect(current_path).to eq('/cycle_shops/new')
  end

  it 'can create a new cycle_shop' do
    visit '/cycle_shops/new'

    fill_in('Name', with: 'Absolute Bikes')
    fill_in('Rental program', with: false)
    fill_in('Bike capacity', with: 77)
    click_button('Create Cycle Shop')

    new_cycle_shop_id = CycleShop.last.id
    expect(current_path).to eq("/cycle_shops/#{new_cycle_shop_id}")
    expect(page).to have_content('Absolute Bikes')
  end
end