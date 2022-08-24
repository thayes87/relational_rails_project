require 'rails_helper'

RSpec.describe CycleShop, type: :model do
  it { should have_many(:bikes) }
end