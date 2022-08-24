class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.integer :frame_size
      t.boolean :demo_available
      t.references :cycle_shop, foreign_key: true
      t.timestamps
    end
  end
end
