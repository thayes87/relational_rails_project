require 'rails_helper'

RSpec.describe 'the cycle_shop creation' do
  
  it 'links to the new page from the cycle_shop index' do
    #user story 11, Parent Creation   
    visit '/cycle_shops'

    click_link('Create Shop')
    expect(current_path).to eq('/cycle_shops/new')

    fill_in('Name', with: 'Absolute Bikes')
    fill_in('Rental program', with: false)
    fill_in('Bike capacity', with: 77)
    click_button('Submit')
    
    expect(current_path).to eq("/cycle_shops")
    expect(page).to have_content('Absolute Bikes')
    expect(CycleShop.count).to eq(1)
  end
end
