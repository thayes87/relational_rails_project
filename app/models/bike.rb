class Bike < ApplicationRecord
  belongs_to :cycle_shop
  validates :brand, presence: true
  validates :frame_size, presence: true
  validates :demo_available, inclusion: [true, false]
end
