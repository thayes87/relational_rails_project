require 'rails_helper'

RSpec.describe 'cycle_shop edit' do
  before(:each) do
    @shop1 = CycleShop.create!(name: "Oer the Edge", rental_program: true, bike_capacity: 275)
  end
  it 'can edit the cycle_shop' do
    #user story 12, Parent Update
    visit "/cycle_shops/#{@shop1.id}"

    expect(page).to have_content("Oer the Edge")

    click_link "Edit"
    expect(current_path).to eq("/cycle_shops/#{@shop1.id}/edit")
    
    fill_in 'name', with: "Over the Edge"
    fill_in 'rental_program', with: true
    fill_in 'bike_capacity', with: 275

    click_button "Submit"
    expect(current_path).to eq("/cycle_shops/#{@shop1.id}")

    expect(page).to_not have_content('Oer the Edge')
    expect(@shop1.reload.name).to eq('Over the Edge')
  end
end
