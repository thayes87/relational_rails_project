class CreateCycleShops < ActiveRecord::Migration[5.2]
  def change
    create_table :cycle_shops do |t|
      t.string :name
      t.boolean :rental_program
      t.integer :bike_capacity
      t.timestamps
    end
  end
end
