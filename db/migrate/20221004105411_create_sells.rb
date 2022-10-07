class CreateSells < ActiveRecord::Migration[6.1]
  def change
    create_table :sells do |t|
      t.string :brand
      t.string :model
      t.string :price
      t.string :variant
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
