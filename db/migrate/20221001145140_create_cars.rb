class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :price
      t.string :manufacture_year
      t.string :variant

      t.timestamps
    end
  end
end
