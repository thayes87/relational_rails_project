require 'rails_helper'

RSpec.describe Bike, type: :model do
  it { should belong_to :cycle_shop }
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:frame_size) }
  it { should allow_value(true).for(:demo_available) }
  it { should allow_value(false).for(:demo_available) }
end