require 'rails_helper'

RSpec.describe CycleShop, type: :model do
  describe 'validations' do
    it { should have_many(:bikes) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bike_capacity) }
    it { should allow_value(true).for(:rental_program) }
    it { should allow_value(false).for(:rental_program) }
  end 
end