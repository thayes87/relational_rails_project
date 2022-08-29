class CycleShop < ApplicationRecord
  has_many :bikes, :dependent => :destroy
  validates :name, presence: true
  validates :rental_program, inclusion: [true, false]
  validates :bike_capacity, presence: true
end